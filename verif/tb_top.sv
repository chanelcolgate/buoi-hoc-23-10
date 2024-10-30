module tb_top;
  `include "uvm_macros.svh"

  import uvm_pkg::*;

  sfifo_interface tif();

  sync_fifo DUT (
    .clk(tif.clk),
    .reset(tif.reset),
    .wr_en(tif.wr_en),
    .rd_en(tif.rd_en),
    .input_data(tif.input_data),
    .empty(tif.empty),
    .full(tif.full),
    .output_data(tif.output_data)
  );

  initial
  begin
    uvm_config_db#(virtual sfifo_interface)::set(null, "*", "vif", tif);
    run_test();
  end
endmodule
