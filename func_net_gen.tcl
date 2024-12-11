read_verilog "sync_fifo.v"
synth_design -top "sync_fifo" -part "xc7z010iclg225-1L"
write_verilog -mode funcsim sync_fifo_netlist.v
