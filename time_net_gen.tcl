read_verilog "sync_fifo.v"
synth_design -top "sync_fifo" -part "xc7z010iclg225-1L"
write_verilog -mode timesim -sdf_anno true postSynth_netlist.v -force
write_sdf postSynth_netlist.sdf -force
