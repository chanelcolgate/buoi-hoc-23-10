# vcom sync_fifo.vhd
compile:
	vlib work
	vmap unisims_ver unisims_ver
	vmap work work
	vlog -f tb_2.f

simulate:
	vsim -c tb_top glbl -L unisims_ver -do run.do -coverage +UVM_TESTNAME=spi_test

clean:
	rmdir /s /q work
	del modelsim.ini
	del vsim.wlf
	del vsim_stacktrace.vstf
	del transcript
	del sfifo.ucdb

clean_linux:
	rm -r work
	rm modelsim.ini
	rm vsim.wlf
	rm vsim_stacktrace.vstf
	rm transcript
	rm sfifo.ucdb
