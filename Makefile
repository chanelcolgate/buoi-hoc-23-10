compile:
	vlib work
	vmap work work
	vlog tdp_ram.v
	vlog -f tb.f

simulate:
	vopt work.top -o top_optimized +acc +cover=sbfec
	vsim -c top_optimized -do run.do -coverage +UVM_TESTNAME=tdpram_test

clean:
		rmdir /s /q work
		del modelsim.ini
		del vsim.wlf
		del vsim_stacktrace.vstf
		del transcript
