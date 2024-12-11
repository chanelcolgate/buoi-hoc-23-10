# vcom sync_fifo.vhd
# vopt work.tb_top -o top_optimized +acc +cover=sbfec
compile:
	vlib work
	vmap unisims_ver unisims_ver
	vmap work work
	vlog sync_fifo_netlist.v
	vlog -f tb.f

compile_time:
	vlib work
	vmap simprims_ver simprims_ver
	vmap work work
	vlog postSynth_netlist.v
	vlog sync_fifo_tb.v

simulate:
	vsim -c tb_top glbl -L unisims_ver -do run.do -coverage +UVM_TESTNAME=sfifo_test

simulate_gui:
	vsim sync_fifo glbl -L unisims_ver -do wave.do

simulate_time:
	vsim sync_fifo glbl -L simprims_ver -sdfmax postSynth_netlist.sdf -sdfnoerror -do wave.do

simulate_tb:
	vsim sync_fifo_tb glbl -L simprims_ver -sdfmax /dut=postSynth_netlist.sdf -sdfnoerror

clean:
	rmdir /s /q work
	del modelsim.ini
	del vsim.wlf
	del vsim_stacktrace.vstf
	del transcript
	del sfifo.ucdb
