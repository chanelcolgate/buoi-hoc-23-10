`timescale 1ns/1ps
module top;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    logic clk;

    initial begin
        clk = 0;
        forever begin
            #10;
            clk = ~clk;
        end
    end

    uart_interface tif (clock);

    initial begin
        uvm_config_db#(virtual uart_interface)::set(null, "*", "vif", tif);
        run_test();
    end
endmodule
