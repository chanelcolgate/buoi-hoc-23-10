add wave -r /*
add list -r /*

force -freeze clk 0, 0, 1 {25 ps} -r 50
force reset 1
run 10
force input_data f5
run 10
force reset 0
run 10
force reset 1
run 10
force wr_en 1
run 10
force input_data 3f
run 100
force reset 0
run 300
force reset 1
force rd_en 1
run 400
force reset 0
run 200
