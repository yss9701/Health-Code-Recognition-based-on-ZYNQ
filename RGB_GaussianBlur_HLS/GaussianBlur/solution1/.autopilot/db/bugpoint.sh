export PATH=D:/zynq_zhengdian/Vivado/2018.3/msys64/usr/bin;D:/zynq_zhengdian/Vivado/2018.3/msys64/mingw64/bin;D:/zynq_zhengdian/Vivado/2018.3/bin;D:/zynq_zhengdian/Vivado/2018.3/win64/bin;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/bin;D:/zynq_zhengdian/Vivado/2018.3/bin;D:/zynq_zhengdian/Vivado/2018.3/lib/win64.o;D:/zynq_zhengdian/Vivado/2018.3/tps/win64/jre9.0.4/bin/server;D:/zynq_zhengdian/Vivado/2018.3/tps/win64/jre9.0.4/bin;D:/zynq_zhengdian/SDK/2018.3/bin;D:/zynq_zhengdian/Vivado/2018.3/ids_lite/ISE/bin/nt64;D:/zynq_zhengdian/Vivado/2018.3/ids_lite/ISE/lib/nt64;D:\zynq_zhengdian\Vivado\2018.3\bin\..\msys64\mingw64\bin;D:\zynq_zhengdian\Vivado\2018.3\bin\..\msys64\usr\bin;D:/zynq_zhengdian/Vivado/2018.3/msys64/usr/bin;D:/zynq_zhengdian/Vivado/2018.3/msys64/mingw64/bin;D:/zynq_zhengdian/Vivado/2018.3/win64/bin;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/bin;D:\zynq_zhengdian\Vivado\2018.3\msys64\usr\bin��D:\zynq_zhengdian\Vivado\2018.3\msys64\mingw64\bin;;C:\Program Files\Git\cmd;C:\Users\hp\AppData\Local\Programs\Python\Python38-32\Scripts\;C:\Users\hp\AppData\Local\Programs\Python\Python38-32\;C:\Users\hp\AppData\Local\Microsoft\WindowsApps;D:\modeltech64_10.4\win64;D:\opencv\opencv\build\x64\vc14\bin;G:\VScode\Microsoft VS Code\bin;D:/zynq_zhengdian/Vivado/2018.3\tps\mingw\6.2.0\win64.o\nt\bin;D:/zynq_zhengdian/Vivado/2018.3\tps\mingw\6.2.0\win64.o\nt\libexec\gcc\x86_64-w64-mingw32\6.2.0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fpo_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fft_v9_1;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/opencv;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fir_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/dds_v6_0;D:/zynq_zhengdian/Vivado/2018.3/win64/lib/csim;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fpo_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fft_v9_1;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/opencv;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fir_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/dds_v6_0;D:/zynq_zhengdian/Vivado/2018.3/win64/lib/csim
export LD_LIBRARY_PATH=D:/zynq_zhengdian/Vivado/2018.3/win64/tools/gdb_v7_2;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/graphviz/lib;D:/zynq_zhengdian/Vivado/2018.3/win64/bin;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/gdb_v7_2;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/graphviz/lib;D:/zynq_zhengdian/Vivado/2018.3/win64/bin;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fpo_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fft_v9_1;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/opencv;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fir_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/dds_v6_0;D:/zynq_zhengdian/Vivado/2018.3/win64/lib/csim;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fpo_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fft_v9_1;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/opencv;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/fir_v7_0;D:/zynq_zhengdian/Vivado/2018.3/win64/tools/dds_v6_0;D:/zynq_zhengdian/Vivado/2018.3/win64/lib/csim
export HDI_APPROOT=D:/zynq_zhengdian/Vivado/2018.3
export XILINX_OPENCL_CLANG=D:/zynq_zhengdian/Vivado/2018.3/win64/tools/clang
export RDI_PLATFORM=win64
bugpoint -mlimit=32000  --load libhls_support.so  --load libhls_bugpoint.so  -hls -strip  -function-uniquify -auto-function-inline -globaldce  -ptrArgReplace -mem2reg -instcombine -dce  -reset-lda  -loop-simplify -indvars -licm -loop-dep  -loop-bound -licm -loop-simplify -flattenloopnest  -array-flatten -gvn -instcombine -dce  -array-map -dce -func-legal  -gvn -adce -instcombine -cfgopt -simplifycfg -loop-simplify   -array-burst -promote-global-argument -dce  -axi4-lower -array-seg-normalize  -basicaa -aggrmodref-aa -globalsmodref-aa -aggr-aa -gvn -gvn  -basicaa -aggrmodref-aa -globalsmodref-aa -aggr-aa -dse -adse -adce -licm  -inst-simplify -dce  -globaldce -instcombine -array-stream -eliminate-keepreads -instcombine  -dce   -deadargelim -doublePtrSimplify  -doublePtrElim -dce -doublePtrSimplify -promote-dbg-pointer  -dce -scalarrepl -mem2reg -disaggr -norm-name -mem2reg  -instcombine  -dse -adse -adce -ptrLegalization -dce -auto-rom-infer -array-flatten -dce -instcombine -check-doubleptr  -loop-rot -constprop -cfgopt -simplifycfg -loop-simplify -indvars -pointer-simplify -dce -loop-bound  -loop-simplify -loop-preproc  -constprop -global-constprop -gvn -mem2reg -instcombine -dce  -loop-bound  -loop-merge -dce  -bitwidthmin  -deadargelim -dce  -canonicalize-dataflow -dce  -scalar-propagation -deadargelim -globaldce -mem2reg  -read-loop-dep  -interface-preproc -directive-preproc -interface-gen  -bram-byte-enable  -deadargelim -inst-simplify -dce  -gvn -mem2reg -instcombine -dce -adse  -loop-bound  -instcombine -cfgopt -simplifycfg -loop-simplify  -clean-region -io-protocol  -find-region -mem2reg  -bitop-raise  -inst-simplify -inst-rectify -instcombine -adce -deadargelim  -loop-simplify -phi-opt -bitop-raise  -cfgopt -simplifycfg -strip-dead-prototypes  -interface-lower -bitop-lower -intrinsic-lower -auto-function-inline  -basicaa -aggrmodref-aa -globalsmodref-aa -aggr-aa  -inst-simplify -simplifycfg   -loop-simplify  -mergereturn -inst-simplify -inst-rectify  -dce -load-elim -bitop-lower  -loop-rewind -pointer-simplify -dce -cfgopt  -dce -bitwidth -loop-bound -loop-dep -read-loop-dep -dce  -check-stream -norm-name -legalize  -validate-dataflow -inst-clarity  G:/xilinx_summer/project/gray_filter/gray_filter/solution1/.autopilot/db/a.o.2.bc
llvm-dis bugpoint-reduced-simplified.bc 
