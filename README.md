# Health-Code-Recognition-based-on-ZYNQ
2020年新工科联盟-Xilinx暑期学校（Summer School）项目

1.设计概述

本设计为基于ZYNQ7020的健康码识别系统。通过OV5640摄像头，从PL侧采集RGB图像数据，经过使用HLS工具综合出的图像处理IP，实现彩色图像的高斯滤波，去除图像噪声，并将处理后的图像通过VDMA保存到DDR中。PS侧通过Linux系统，利用V4L2框架调用VDMA，将图像由DDR中读出，利用OpenCV库，对图像进行二值化处理。通过Zbar库，对二值化的图像进行二维码定位与识别，利用OpenCV库，对二维码区域进行颜色识别。最后，将识别结果叠加到原图像上，利用VDMA写回DDR，LCD读取DDR数据，将图像显示出来。系统整体框图如图1所示。

![img](G:\xilinx_summer\project\Health code recognition_ZYNQ7020\Health-Code-Recognition-based-on-ZYNQ\image\整体框图.png)

​                                                                               图1 整体框图

 对绿码与黄码进行识别，识别结果如图2、图3所示。屏幕左上角为颜色识别结果，屏幕中央为二维码内容识别结果。

![](G:\xilinx_summer\project\Health code recognition_ZYNQ7020\Health-Code-Recognition-based-on-ZYNQ\image\绿码识别.png)

​                                                                              图2 绿码识别结果

![](G:\xilinx_summer\project\Health code recognition_ZYNQ7020\Health-Code-Recognition-based-on-ZYNQ\image\黄码识别.png)

​                                                                               图3 黄码识别结果

2.文件结构

Boot_file为利用Petalinux生成的引导文件BOOT.bin与image.ub。image为识别结果图片。RGB_GaussianBlur_HLS为HLS工程，主要为彩色图像的分层滤波。Vivado_project为整个系统的Vivado工程。main.cc为二维码识别程序，包括摄像头数据读入，图像处理，二维码内容识别、定位与颜色识别，LCD图像显示。

3.硬件设备

板卡为正点原子领航者ZYNQ7020开发板，摄像头为OV5640，LCD为800*480分辨率，Vivado、HLS、Xilinx SDK、Petalinux均为2018.3，根文件系统为PYNQ v2.5。
