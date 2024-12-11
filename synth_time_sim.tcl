# Post-Synthesis Timing Simulation ------------------------------------------------------------------------

create_project -force synth_time_sfifo G:/UVM_Project/imp_sfifo -part xc7a35tcpg236-1

add_files -norecurse -scan_for_includes G:/UVM_Project/imp_sfifo/sync_fifo.v
import_files -norecurse G:/UVM_Project/imp_sfifo/sync_fifo.v
update_compile_order -fileset sources_1

set_property SOURCE_SET sources_1 [get_filesets sim_1]

add_files -fileset sim_1 -norecurse -scan_for_includes G:/UVM_Project/imp_sfifo/sync_fifo_tb.v
import_files -fileset sim_1 -norecurse G:/UVM_Project/imp_sfifo/sync_fifo_tb.v
update_compile_order -fileset sim_1

update_compile_order -fileset sim_1

add_files -norecurse -scan_for_includes sfifo_nophy_constraints.xdc
import_files -norecurse sfifo_nophy_constraints.xdc
update_compile_order -fileset constrs_1

# Run Synthesis:
launch_runs synth_1

wait_on_run synth_1
open_run synth_1

# Output Verilog netlist + SDC for timing simulation:
write_verilog -mode timesim -sdf_anno true postSynth_netlist.v -force

write_sdf G:/UVM_Project/imp_sfifo/postSynth.sdf -force

check_timing -verbose                                                   -file reports/check_timing.rpt
report_timing -max_paths 10 -nworst 10 -delay_type max -sort_by slack   -file reports/timing_WORST_10.rpt
report_timing -nworst 1 -delay_type max -sort_by group                  -file reports/timing.rpt
report_utilization -hierarchical                                        -file reports/utilization.rpt
#report_cdc                                                              -file reports/cdc.rpt
#report_clock_interaction                                                -file reports/clock_interaction.rpt

launch_simulation -mode post-synthesis -type timing

#close_project