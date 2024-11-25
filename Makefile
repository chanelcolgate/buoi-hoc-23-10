# vcom sync_fifo.vhd
# vopt work.tb_top -o top_optimized +acc +cover=sbfec
compile:
	vlib work
	vmap unisims_ver unisims_ver
	vmap work work
	vlog sync_fifo_netlist.v
	vlog -f tb.f

simulate:
	vsim -c tb_top glbl -L unisims_ver -do run.do -coverage +UVM_TESTNAME=sfifo_test

clean:
	rmdir /s /q work
	del modelsim.ini
	del vsim.wlf
	del vsim_stacktrace.vstf
	del transcript
	del sfifo.ucdb
