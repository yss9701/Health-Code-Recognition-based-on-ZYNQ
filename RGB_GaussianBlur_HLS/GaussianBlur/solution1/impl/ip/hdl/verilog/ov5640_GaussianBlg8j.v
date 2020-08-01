// ==============================================================
// File generated on Fri Jul 31 10:05:18 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps

module ov5640_GaussianBlg8j_DSP48_1 (
    input  [8 - 1:0] in0,
    input  [8 - 1:0] in1,
    input  [11 - 1:0] in2,
    input  [24 - 1:0] in3,
    output [25 - 1:0]  dout);


wire signed [18 - 1:0]     b;
wire signed [25 - 1:0]     a;
wire signed [25 - 1:0]     d;
wire signed [48 - 1:0]     c;
wire signed [43 - 1:0]     m;
wire signed [48 - 1:0]     p;
wire signed [25 - 1:0]     ad;

assign a = $unsigned(in0);
assign d = $unsigned(in1);
assign b = $unsigned(in2);
assign c = $unsigned(in3);

assign ad = a + d;
assign m  = ad * b;
assign p  = m + c;

assign dout = p;

endmodule
`timescale 1 ns / 1 ps
module ov5640_GaussianBlg8j(
    din0,
    din1,
    din2,
    din3,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter din3_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
input[din3_WIDTH - 1:0] din3;
output[dout_WIDTH - 1:0] dout;



ov5640_GaussianBlg8j_DSP48_1 ov5640_GaussianBlg8j_DSP48_1_U(
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .in3( din3 ),
    .dout( dout ));

endmodule

