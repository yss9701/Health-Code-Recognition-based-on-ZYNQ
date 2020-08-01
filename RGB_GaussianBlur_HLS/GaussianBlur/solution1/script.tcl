############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project gray_filter
set_top ov5640_GaussianBlur
add_files gray_filter/src/ov5640_rgb2gray.cpp
open_solution "solution1"
set_part {xc7z020clg400-2} -tool vivado
create_clock -period 10 -name default
config_compile -no_signed_zeros=0 -unsafe_math_optimizations=0
config_export -format ip_catalog -rtl verilog -vivado_phys_opt place -vivado_report_level 0
config_sdx -optimization_level none -target none
config_bind -effort medium
config_schedule -effort medium -relax_ii_for_timing=0
set_clock_uncertainty 12.5%
#source "./gray_filter/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl verilog -format ip_catalog
