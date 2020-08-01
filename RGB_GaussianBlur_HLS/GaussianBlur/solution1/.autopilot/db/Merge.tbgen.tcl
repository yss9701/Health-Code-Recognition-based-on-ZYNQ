set moduleName Merge
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Merge}
set C_modelType { void 0 }
set C_modelArgList {
	{ src0_data_stream_V int 8 regular {fifo 0 volatile }  }
	{ src1_data_stream_V int 8 regular {fifo 0 volatile }  }
	{ src2_data_stream_V int 8 regular {fifo 0 volatile }  }
	{ dst_rows_V int 10 regular {fifo 0}  }
	{ dst_cols_V int 11 regular {fifo 0}  }
	{ dst_data_stream_0_V int 8 regular {fifo 1 volatile }  }
	{ dst_data_stream_1_V int 8 regular {fifo 1 volatile }  }
	{ dst_data_stream_2_V int 8 regular {fifo 1 volatile }  }
	{ dst_rows_V_out int 10 regular {fifo 1}  }
	{ dst_cols_V_out int 11 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "src0_data_stream_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "src1_data_stream_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "src2_data_stream_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "dst_rows_V", "interface" : "fifo", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "dst_cols_V", "interface" : "fifo", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "dst_data_stream_0_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dst_data_stream_1_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dst_data_stream_2_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dst_rows_V_out", "interface" : "fifo", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dst_cols_V_out", "interface" : "fifo", "bitwidth" : 11, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ src0_data_stream_V_dout sc_in sc_lv 8 signal 0 } 
	{ src0_data_stream_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ src0_data_stream_V_read sc_out sc_logic 1 signal 0 } 
	{ src1_data_stream_V_dout sc_in sc_lv 8 signal 1 } 
	{ src1_data_stream_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ src1_data_stream_V_read sc_out sc_logic 1 signal 1 } 
	{ src2_data_stream_V_dout sc_in sc_lv 8 signal 2 } 
	{ src2_data_stream_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ src2_data_stream_V_read sc_out sc_logic 1 signal 2 } 
	{ dst_rows_V_dout sc_in sc_lv 10 signal 3 } 
	{ dst_rows_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ dst_rows_V_read sc_out sc_logic 1 signal 3 } 
	{ dst_cols_V_dout sc_in sc_lv 11 signal 4 } 
	{ dst_cols_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ dst_cols_V_read sc_out sc_logic 1 signal 4 } 
	{ dst_data_stream_0_V_din sc_out sc_lv 8 signal 5 } 
	{ dst_data_stream_0_V_full_n sc_in sc_logic 1 signal 5 } 
	{ dst_data_stream_0_V_write sc_out sc_logic 1 signal 5 } 
	{ dst_data_stream_1_V_din sc_out sc_lv 8 signal 6 } 
	{ dst_data_stream_1_V_full_n sc_in sc_logic 1 signal 6 } 
	{ dst_data_stream_1_V_write sc_out sc_logic 1 signal 6 } 
	{ dst_data_stream_2_V_din sc_out sc_lv 8 signal 7 } 
	{ dst_data_stream_2_V_full_n sc_in sc_logic 1 signal 7 } 
	{ dst_data_stream_2_V_write sc_out sc_logic 1 signal 7 } 
	{ dst_rows_V_out_din sc_out sc_lv 10 signal 8 } 
	{ dst_rows_V_out_full_n sc_in sc_logic 1 signal 8 } 
	{ dst_rows_V_out_write sc_out sc_logic 1 signal 8 } 
	{ dst_cols_V_out_din sc_out sc_lv 11 signal 9 } 
	{ dst_cols_V_out_full_n sc_in sc_logic 1 signal 9 } 
	{ dst_cols_V_out_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "src0_data_stream_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "src0_data_stream_V", "role": "dout" }} , 
 	{ "name": "src0_data_stream_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "src0_data_stream_V", "role": "empty_n" }} , 
 	{ "name": "src0_data_stream_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "src0_data_stream_V", "role": "read" }} , 
 	{ "name": "src1_data_stream_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "src1_data_stream_V", "role": "dout" }} , 
 	{ "name": "src1_data_stream_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "src1_data_stream_V", "role": "empty_n" }} , 
 	{ "name": "src1_data_stream_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "src1_data_stream_V", "role": "read" }} , 
 	{ "name": "src2_data_stream_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "src2_data_stream_V", "role": "dout" }} , 
 	{ "name": "src2_data_stream_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "src2_data_stream_V", "role": "empty_n" }} , 
 	{ "name": "src2_data_stream_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "src2_data_stream_V", "role": "read" }} , 
 	{ "name": "dst_rows_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dst_rows_V", "role": "dout" }} , 
 	{ "name": "dst_rows_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_rows_V", "role": "empty_n" }} , 
 	{ "name": "dst_rows_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_rows_V", "role": "read" }} , 
 	{ "name": "dst_cols_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "dst_cols_V", "role": "dout" }} , 
 	{ "name": "dst_cols_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_cols_V", "role": "empty_n" }} , 
 	{ "name": "dst_cols_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_cols_V", "role": "read" }} , 
 	{ "name": "dst_data_stream_0_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dst_data_stream_0_V", "role": "din" }} , 
 	{ "name": "dst_data_stream_0_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_data_stream_0_V", "role": "full_n" }} , 
 	{ "name": "dst_data_stream_0_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_data_stream_0_V", "role": "write" }} , 
 	{ "name": "dst_data_stream_1_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dst_data_stream_1_V", "role": "din" }} , 
 	{ "name": "dst_data_stream_1_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_data_stream_1_V", "role": "full_n" }} , 
 	{ "name": "dst_data_stream_1_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_data_stream_1_V", "role": "write" }} , 
 	{ "name": "dst_data_stream_2_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dst_data_stream_2_V", "role": "din" }} , 
 	{ "name": "dst_data_stream_2_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_data_stream_2_V", "role": "full_n" }} , 
 	{ "name": "dst_data_stream_2_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_data_stream_2_V", "role": "write" }} , 
 	{ "name": "dst_rows_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "dst_rows_V_out", "role": "din" }} , 
 	{ "name": "dst_rows_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_rows_V_out", "role": "full_n" }} , 
 	{ "name": "dst_rows_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_rows_V_out", "role": "write" }} , 
 	{ "name": "dst_cols_V_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "dst_cols_V_out", "role": "din" }} , 
 	{ "name": "dst_cols_V_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_cols_V_out", "role": "full_n" }} , 
 	{ "name": "dst_cols_V_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dst_cols_V_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Merge",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "385441",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "src0_data_stream_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "src0_data_stream_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "src1_data_stream_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "src1_data_stream_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "src2_data_stream_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "src2_data_stream_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_rows_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_rows_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_cols_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_cols_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_data_stream_0_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_data_stream_0_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_data_stream_1_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_data_stream_1_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_data_stream_2_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_data_stream_2_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_rows_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_rows_V_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dst_cols_V_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "dst_cols_V_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	Merge {
		src0_data_stream_V {Type I LastRead 3 FirstWrite -1}
		src1_data_stream_V {Type I LastRead 3 FirstWrite -1}
		src2_data_stream_V {Type I LastRead 3 FirstWrite -1}
		dst_rows_V {Type I LastRead 0 FirstWrite -1}
		dst_cols_V {Type I LastRead 0 FirstWrite -1}
		dst_data_stream_0_V {Type O LastRead -1 FirstWrite 3}
		dst_data_stream_1_V {Type O LastRead -1 FirstWrite 3}
		dst_data_stream_2_V {Type O LastRead -1 FirstWrite 3}
		dst_rows_V_out {Type O LastRead -1 FirstWrite 0}
		dst_cols_V_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "385441"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "385441"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	src0_data_stream_V { ap_fifo {  { src0_data_stream_V_dout fifo_data 0 8 }  { src0_data_stream_V_empty_n fifo_status 0 1 }  { src0_data_stream_V_read fifo_update 1 1 } } }
	src1_data_stream_V { ap_fifo {  { src1_data_stream_V_dout fifo_data 0 8 }  { src1_data_stream_V_empty_n fifo_status 0 1 }  { src1_data_stream_V_read fifo_update 1 1 } } }
	src2_data_stream_V { ap_fifo {  { src2_data_stream_V_dout fifo_data 0 8 }  { src2_data_stream_V_empty_n fifo_status 0 1 }  { src2_data_stream_V_read fifo_update 1 1 } } }
	dst_rows_V { ap_fifo {  { dst_rows_V_dout fifo_data 0 10 }  { dst_rows_V_empty_n fifo_status 0 1 }  { dst_rows_V_read fifo_update 1 1 } } }
	dst_cols_V { ap_fifo {  { dst_cols_V_dout fifo_data 0 11 }  { dst_cols_V_empty_n fifo_status 0 1 }  { dst_cols_V_read fifo_update 1 1 } } }
	dst_data_stream_0_V { ap_fifo {  { dst_data_stream_0_V_din fifo_data 1 8 }  { dst_data_stream_0_V_full_n fifo_status 0 1 }  { dst_data_stream_0_V_write fifo_update 1 1 } } }
	dst_data_stream_1_V { ap_fifo {  { dst_data_stream_1_V_din fifo_data 1 8 }  { dst_data_stream_1_V_full_n fifo_status 0 1 }  { dst_data_stream_1_V_write fifo_update 1 1 } } }
	dst_data_stream_2_V { ap_fifo {  { dst_data_stream_2_V_din fifo_data 1 8 }  { dst_data_stream_2_V_full_n fifo_status 0 1 }  { dst_data_stream_2_V_write fifo_update 1 1 } } }
	dst_rows_V_out { ap_fifo {  { dst_rows_V_out_din fifo_data 1 10 }  { dst_rows_V_out_full_n fifo_status 0 1 }  { dst_rows_V_out_write fifo_update 1 1 } } }
	dst_cols_V_out { ap_fifo {  { dst_cols_V_out_din fifo_data 1 11 }  { dst_cols_V_out_full_n fifo_status 0 1 }  { dst_cols_V_out_write fifo_update 1 1 } } }
}
