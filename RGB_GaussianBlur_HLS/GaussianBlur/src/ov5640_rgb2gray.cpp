#include "hls_video.h"

#define HEIGHT 480		//ͼ��߶�
#define WIDTH  800		//ͼ����

typedef hls::stream<ap_axiu<24,1,1,1> >  AXI_STREAM;
typedef hls::Mat<HEIGHT,WIDTH,HLS_8UC3> RGB_IMAGE;
typedef hls::Mat<HEIGHT,WIDTH,HLS_8UC1> GRAY_IMAGE;

void ov5640_GaussianBlur(AXI_STREAM & INPUT_STREAM,
				 	 AXI_STREAM & OUTPUT_STREAM
					 ){

#pragma HLS INTERFACE axis port=INPUT_STREAM
#pragma HLS INTERFACE axis port=OUTPUT_STREAM
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS dataflow

	//hls::mat��ʽ����
	RGB_IMAGE  img_0(HEIGHT,WIDTH);
	GRAY_IMAGE img_R(HEIGHT,WIDTH);
	GRAY_IMAGE img_G(HEIGHT,WIDTH);
	GRAY_IMAGE img_B(HEIGHT,WIDTH);
	GRAY_IMAGE img_R_f(HEIGHT,WIDTH);
    GRAY_IMAGE img_G_f(HEIGHT,WIDTH);
	GRAY_IMAGE img_B_f(HEIGHT,WIDTH);
	RGB_IMAGE  img_1(HEIGHT,WIDTH);

	//��AXI4 Stream����ת����hls::mat��ʽ
	hls::AXIvideo2Mat(INPUT_STREAM,img_0);

	//��RGB888��ʽ�Ĳ�ɫ���ݷ���
	//hls::CvtColor<HLS_RGB2GRAY,HLS_8UC3,HLS_8UC1>(img_0,img_1);
	hls::Split<HEIGHT,WIDTH>(img_0,img_B,img_G,img_R);

	//��ͨ���ֱ��˲�
    hls::GaussianBlur<3,3>(img_B,img_B_f);
    hls::GaussianBlur<3,3>(img_G,img_G_f);
    hls::GaussianBlur<3,3>(img_R,img_R_f);

	//����ͨ�����ݺϲ�
	//hls::CvtColor<HLS_GRAY2RGB,HLS_8UC1,HLS_8UC3>(img_3,img_2);
    hls::Merge<HEIGHT,WIDTH>(img_B_f,img_G_f,img_R_f,img_1);

	//��hls::mat��ʽ����ת����AXI4 Stream��ʽ
	hls::Mat2AXIvideo(img_1,OUTPUT_STREAM);
}
