#include "hls_video.h"

#define HEIGHT 480		//图像高度
#define WIDTH  800		//图像宽度

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

	//hls::mat格式变量
	RGB_IMAGE  img_0(HEIGHT,WIDTH);
	GRAY_IMAGE img_R(HEIGHT,WIDTH);
	GRAY_IMAGE img_G(HEIGHT,WIDTH);
	GRAY_IMAGE img_B(HEIGHT,WIDTH);
	GRAY_IMAGE img_R_f(HEIGHT,WIDTH);
    GRAY_IMAGE img_G_f(HEIGHT,WIDTH);
	GRAY_IMAGE img_B_f(HEIGHT,WIDTH);
	RGB_IMAGE  img_1(HEIGHT,WIDTH);

	//将AXI4 Stream数据转换成hls::mat格式
	hls::AXIvideo2Mat(INPUT_STREAM,img_0);

	//将RGB888格式的彩色数据分离
	//hls::CvtColor<HLS_RGB2GRAY,HLS_8UC3,HLS_8UC1>(img_0,img_1);
	hls::Split<HEIGHT,WIDTH>(img_0,img_B,img_G,img_R);

	//三通道分别滤波
    hls::GaussianBlur<3,3>(img_B,img_B_f);
    hls::GaussianBlur<3,3>(img_G,img_G_f);
    hls::GaussianBlur<3,3>(img_R,img_R_f);

	//将三通道数据合并
	//hls::CvtColor<HLS_GRAY2RGB,HLS_8UC1,HLS_8UC3>(img_3,img_2);
    hls::Merge<HEIGHT,WIDTH>(img_B_f,img_G_f,img_R_f,img_1);

	//将hls::mat格式数据转换成AXI4 Stream格式
	hls::Mat2AXIvideo(img_1,OUTPUT_STREAM);
}
