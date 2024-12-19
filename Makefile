# vcom sync_fifo.vhd
compile:
	vlib work
	vmap work work
	vlog dma.sv
	vlog -f tb.f

simulate:
	vopt work.tb_top -o top_optimized +acc +cover=sbfec
	vsim -c top_optimized -do run.do -coverage +UVM_TESTNAME=dma_test

clean:
	rmdir /s /q work
	del modelsim.ini
	del vsim.wlf
	del vsim_stacktrace.vstf
	del transcript
	del sfifo.ucdb
