/*  For description look into the help() function. */

#include "opencv2/core/core.hpp"
#include "opencv2/opencv.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <linux/videodev2.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <linux/videodev2.h>
#include <sys/mman.h>
#include <linux/fb.h>
#include <pthread.h>
#include <linux/input.h>
#include <iostream>
#include "zbar.h"

using namespace std;
using namespace cv;
using namespace zbar;

#define VIDEO_DEV			"/dev/video0"
#define FB_DEV				"/dev/fb0"
#define VIDEO_BUFFER_COUNT	6

struct buffer_info {
	char *start;
	unsigned int length;
};

static void thread_function()
{
	int fb_fd = -1;
	int video_fd = -1;
	struct fb_var_screeninfo fb_var = {0};
	struct fb_fix_screeninfo fb_fix = {0};
	unsigned char *base;
	unsigned int screensize;
	struct v4l2_format fmt = {0};
	struct v4l2_requestbuffers req_bufs = {0};
	static struct v4l2_buffer buf;
	int n_buf;
	struct buffer_info bufs_info[VIDEO_BUFFER_COUNT];
	enum v4l2_buf_type type;

	IplImage* frame_rgb;

	/* 打开framebuffer设备 */
	fb_fd = open(FB_DEV, O_RDWR);
	if (0 > fb_fd) {
		printf("ERROR: failed to open framebuffer device %s\n", FB_DEV);
		//return (void *)-1;
	}

	/* 获取framebuffer设备信息 */
	if (0 > ioctl(fb_fd, FBIOGET_VSCREENINFO, &fb_var)) {
		printf("ERROR: failed to FBIOGET_VSCREENINFO\n");
		//return (void *)-1;
	}

	if (0 > ioctl(fb_fd, FBIOGET_FSCREENINFO, &fb_fix)) {
		printf("ERROR: failed to FBIOGET_FSCREENINFO\n");
		//return (void *)-1;
	}

	/* 内存映射 */
	screensize = fb_var.yres * fb_fix.line_length;
	base = (unsigned char *)mmap(NULL, screensize,
				PROT_READ | PROT_WRITE, MAP_SHARED, fb_fd, 0);
	if (MAP_FAILED == base) {
		printf("ERROR: failed to mmap framebuffer, size 0x%x\n", screensize);
		//return (void *)-1;
	}

	/* 打开摄像头设备 */
	video_fd = open(VIDEO_DEV, O_RDWR);
	if (0 > video_fd) {
		printf("ERROR: failed to open video device %s\n", VIDEO_DEV);
		//return (void *)-1;
	}

	/* 设置摄像头格式 */
	fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	fmt.fmt.pix.width = fb_var.xres;
	fmt.fmt.pix.height = fb_var.yres;
	fmt.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
	fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_RGB24;

	if (0 > ioctl(video_fd, VIDIOC_S_FMT, &fmt)) {
		printf("ERROR: failed to VIDIOC_S_FMT\n");
		//return (void *)-1;
	}

	/* 请求buffer */
	req_bufs.count = VIDEO_BUFFER_COUNT;
	req_bufs.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	req_bufs.memory = V4L2_MEMORY_MMAP;

	if (0 > ioctl(video_fd, VIDIOC_REQBUFS, &req_bufs)) {
		printf("ERROR: failed to VIDIOC_REQBUFS\n");
		//return (void *)-1;
	}

	buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	buf.memory = V4L2_MEMORY_MMAP;
	for (n_buf = 0; n_buf < VIDEO_BUFFER_COUNT; n_buf++) {

		buf.index = n_buf;
		if (0 > ioctl(video_fd, VIDIOC_QUERYBUF, &buf)) {
			printf("ERROR: failed to VIDIOC_QUERYBUF\n");
			//return (void *)-1;
		}

		bufs_info[n_buf].length = buf.length;
		bufs_info[n_buf].start = (char *)mmap(NULL, buf.length,
					PROT_READ | PROT_WRITE, MAP_SHARED,
					video_fd, buf.m.offset);

		if (MAP_FAILED == bufs_info[n_buf].start) {
			printf("ERROR: failed to mmap video buffer, size 0x%x\n", buf.length);
			//return (void *)-1;
		}
	}

	/* buffer入队 */
	for (n_buf = 0; n_buf < VIDEO_BUFFER_COUNT; n_buf++) {

		buf.index = n_buf;
		if (0 > ioctl(video_fd, VIDIOC_QBUF, &buf)) {
			printf("ERROR: failed to VIDIOC_QBUF\n");
			//return (void *)-1;
		}
	}

	frame_rgb = cvCreateImage(cvSize(fb_var.xres, fb_var.yres), IPL_DEPTH_8U, 3);
	//frame_rgb1 = cvCreateImage(cvSize(fb_var.xres, fb_var.yres), IPL_DEPTH_8U, 3);
	Mat image(fb_var.xres, fb_var.yres, CV_8UC3);
    Mat image1(fb_var.xres, fb_var.yres, CV_8UC1);
	Mat image2(fb_var.xres, fb_var.yres, CV_8UC3);
	/* 开始采集 */
	type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	if (0 > ioctl(video_fd, VIDIOC_STREAMON, &type)) {
		printf("ERROR: failed to VIDIOC_STREAMON\n");
		//return (void *)-1;
	}

	for ( ; ; ) {

		for(n_buf = 0; n_buf < VIDEO_BUFFER_COUNT; n_buf++) {

			buf.index = n_buf;
			if (0 > ioctl(video_fd, VIDIOC_DQBUF, &buf)) {
				printf("ERROR: failed to VIDIOC_DQBUF\n");
				//return (void *)-1;
			}
			frame_rgb->imageData = bufs_info[n_buf].start;

			image=cvarrToMat(frame_rgb);

			image2 = image;//
			Mat image_core1;
			cvtColor(image, image1, CV_BGR2GRAY);//转灰度
			image1.copyTo(image_core1);
	
			threshold(image_core1,image_core1,0,255,CV_THRESH_OTSU);//自适应阈值
			
			//畸变校正
			/*cvtColor(image, image1, CV_BGR2GRAY);
			Mat image_core;
			Mat image_core1;
			image1.copyTo(image_core);
			image1.copyTo(image_core1);
			GaussianBlur(image_core,image_core,Size(3,3),0);
			threshold(image_core,image_core,0,255,CV_THRESH_OTSU);
			Mat element = getStructuringElement(2, Size(7,7));
			for(int i=0;i<10;i++)
			{
				erode(image_core,image_core,element);
				i++;
			}
			Mat image_ero;
			erode(image_core,image_ero,element);
			image_ero=image_core-image_ero;

			//寻找直线 边界定位也可以用findContours实现
			vector<Vec2f>lines;
			HoughLines(image_ero,lines,1,CV_PI/150,250,0,0);
			Mat DrawLine=Mat::zeros(image_ero.size(),CV_8UC1);
			for(uint i=0;i<lines.size();i++)
				{
					float rho=lines[i][0];
					float theta=lines[i][1];
					Point pt1,pt2;
					double a=cos(theta),b=sin(theta);
					double x0=a*rho,y0=b*rho;
					pt1.x=cvRound(x0+1000*(-b));
					pt1.y=cvRound(y0+1000*a);
					pt2.x=cvRound(x0-1000*(-b));
					pt2.y=cvRound(y0-1000*a);
					line(DrawLine,pt1,pt2,Scalar(255),1,CV_AA);
				}

			Point2f P1[4];
			Point2f P2[4];
			vector<Point2f>corners;
			goodFeaturesToTrack(DrawLine,corners,4,0.1,10,Mat()); //角点检测
			for(uint i=0;i<corners.size();i++)
			{
				circle(DrawLine,corners[i],3,Scalar(255),3);
				P1[i]=corners[i];
			}
			int width=P1[1].x-P1[0].x;
			int hight=P1[2].y-P1[0].y;
			P2[0]=P1[0];
			P2[1]=Point2f(P2[0].x+width,P2[0].y);
			P2[2]=Point2f(P2[0].x,P2[1].y+hight);
			P2[3]=Point2f(P2[1].x,P2[2].y);
			Mat elementTransf;
			elementTransf=  getAffineTransform(P1,P2);
			warpAffine(image_core1,image_core1,elementTransf,image_core1.size(),1,0,Scalar(255));*/

			//Zbar二维码识别
			ImageScanner scanner;
			scanner.set_config(ZBAR_NONE, ZBAR_CFG_ENABLE, 1);
			int width1 = image_core1.cols;
			int height1 = image_core1.rows;
			uchar *raw = (uchar *)image_core1.data;
			Image imageZbar(width1, height1, "Y800", raw, width1 * height1);
			scanner.scan(imageZbar); //扫描条码
			Image::SymbolIterator symbol = imageZbar.symbol_begin();

			//扫描信息加到图像上
			std::string str1;
			str1 = symbol->get_data();
			double font_scale = 0.8;
			int font_face = cv::FONT_HERSHEY_COMPLEX;
			int thickness = 1;
			int baseline;
			cv::Size text_size = cv::getTextSize(str1, font_face, font_scale, thickness, &baseline);
			cv::Point origin;
			origin.x = image2.cols/2-text_size.width/2;
			origin.y = image2.rows/2+text_size.height/2;

			//颜色识别
			Mat image_roi;
			Mat imgHSV;
			Mat imgThresholded;
			Mat m,n;
			double m_1,n_1;
			Mat image_one;
			std::string str2;
			//取ROI
			if (symbol->get_location_size() == 4)
			 {
				line(image2, Point(symbol->get_location_x(0), symbol->get_location_y(0)), Point(symbol->get_location_x(1), symbol->get_location_y(1)), Scalar(0, 255, 0), 2, 8, 0);
				line(image2, Point(symbol->get_location_x(1), symbol->get_location_y(1)), Point(symbol->get_location_x(2), symbol->get_location_y(2)), Scalar(0, 255, 0), 2, 8, 0);
				line(image2, Point(symbol->get_location_x(2), symbol->get_location_y(2)), Point(symbol->get_location_x(3), symbol->get_location_y(3)), Scalar(0, 255, 0), 2, 8, 0);
				line(image2, Point(symbol->get_location_x(3), symbol->get_location_y(3)), Point(symbol->get_location_x(0), symbol->get_location_y(0)), Scalar(0, 255, 0), 2, 8, 0);
				
				if(symbol->get_location_x(0)<=symbol->get_location_x(2)&&symbol->get_location_y(0)<=symbol->get_location_y(2))
					image_roi = image2(Range(symbol->get_location_y(0),symbol->get_location_y(2)),Range(symbol->get_location_x(0),symbol->get_location_x(2)));
				else if(symbol->get_location_x(0)>=symbol->get_location_x(2)&&symbol->get_location_y(0)<=symbol->get_location_y(2))
					image_roi = image2(Range(symbol->get_location_y(0),symbol->get_location_y(2)),Range(symbol->get_location_x(2),symbol->get_location_x(0)));
				else if(symbol->get_location_x(0)<=symbol->get_location_x(2)&&symbol->get_location_y(0)>=symbol->get_location_y(2))
					image_roi = image2(Range(symbol->get_location_y(2),symbol->get_location_y(0)),Range(symbol->get_location_x(0),symbol->get_location_x(2)));
				else if(symbol->get_location_x(0)>=symbol->get_location_x(2)&&symbol->get_location_y(0)>=symbol->get_location_y(2))
					image_roi = image2(Range(symbol->get_location_y(2),symbol->get_location_y(0)),Range(symbol->get_location_x(2),symbol->get_location_x(0)));
			
				cvtColor(image_roi, imgHSV, COLOR_BGR2HSV);//RGB转HSV
				//彩色图像选取不同阈值做二值化
				for(char i=0; i<3; i++)
				{
					if(i==0)
					{
					inRange(imgHSV, Scalar(0, 0, 0), Scalar(38, 255, 255), imgThresholded);
					image_one=imgThresholded.reshape(0,1);
					meanStdDev(image_one, m, n);
					m_1=m.at<double>(0,0);
					str2="Yellow";
					if(m_1>0.5)
						break;
					else
						str2=" ";
					}
					else if(i==1)
					{
					inRange(imgHSV, Scalar(38, 0, 0), Scalar(130, 255, 255), imgThresholded);
					image_one=imgThresholded.reshape(0,1);
					meanStdDev(image_one, m, n);
					m_1=m.at<double>(0,0);
					str2="Green";
					if(m_1>0.5)
						break;
					else
						str2=" ";
					}
					else if(i==2)
					{
					inRange(imgHSV, Scalar(130, 0, 0), Scalar(180, 255, 255), imgThresholded);
					image_one=imgThresholded.reshape(0,1);
					meanStdDev(image_one, m, n);
					m_1=m.at<double>(0,0);
					str2="Red";
					if(m_1>0.5)
						break;
					else
						str2=" ";
					}
				}
			 }
			 else
			 {
				str2=" "; /* code */
			 }
			cv::putText(image2,str2,Point(100,50),font_face,font_scale,cv::Scalar(0,255,255),thickness,8,0);
			cv::putText(image2,str1,origin,font_face,font_scale,cv::Scalar(0,255,255),thickness,8,0);
			imageZbar.set_data(NULL,0);
			bufs_info[n_buf].start=(char *)image2.data;
			memcpy(base, (unsigned char *)bufs_info[n_buf].start, screensize);

			if (0 > ioctl(video_fd, VIDIOC_QBUF, &buf)) {
				printf("ERROR: failed to VIDIOC_QBUF\n");
			}
		}
	}

}



int main(int argc, char **argv)
{
	pthread_t sub_thread = {0};
	int input_fd = -1;
	struct input_event input_ev;

	thread_function();

}

