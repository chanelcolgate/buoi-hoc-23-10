module tb_top;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    localparam WIDTH_p = 32;

    dma_interface #(WIDTH_p) tif();

    dma #(WIDTH_p) dut (
        .clk(tif.clk),
        .reset(tif.reset),
        .addr(tif.addr),
        .wr_en(tif.wr_en),
        .wdata(tif.wdata),
        .rdata(tif.rdata)
    );

    initial begin
        uvm_config_db#(virtual dma_interface)::set(null, "*", "vif", tif);
        run_test();
    end
endmodule
