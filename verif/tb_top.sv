module tb_top;
  `include "uvm_macros.svh"

  import uvm_pkg::*;

  dma_interface tif();

  dma DUT (
    .clk(tif.clk),
    .reset(tif.reset),
    .addr(tif.addr),
    .wr_en(tif.wr_en),
    .valid(tif.valid),
    .wdata(tif.wdata),
    .rdata(tif.rdata)
  );

  initial
  begin
    uvm_config_db#(virtual dma_interface)::set(null, "*", "vif", tif);
    run_test();
  end
endmodule
