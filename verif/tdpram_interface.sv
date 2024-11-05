`timescale 1ps/1ps
interface tdpram_interface; 
    `include "uvm_macros.svh"

    import uvm_pkg::*;
    import tdpram_pkg::*;

    bit clk;
    bit sclr;
    byte unsigned din_a, din_b;
    bit [5:0] addr_a, addr_b;
    bit we_a, we_b;
    byte unsigned dout_a, dout_b;
    bit se;

    initial begin
        clk = 0;
        forever begin
            #10;
            clk = ~clk;
        end
    end

    task reset_tdpram();
        sclr = 1'b0;
        @(posedge clk);
        #1;
        sclr = 1'b1;
        we_a = 1'b1;
        we_b = 1'b0;
        se = 1'b0;
    endtask

    task write_and_read_port_A(
        input bit [5:0] addr_a_i,
        input byte unsigned din_a_i
    );
        @(posedge clk);
        we_a = 1'b0;
        addr_a = addr_a_i;
        din_a = din_a_i;
        @(posedge clk);
        we_a = 1'b1;
        addr_a = addr_a_i;
    endtask

    input_monitor input_monitor_h;
    output_monitor output_monitor_h;

    always @(posedge clk) begin
        if (we_a == 0) begin
            // $display($sformatf("input a: %2h, addr_a: %d", din_a, addr_a));
            input_monitor_h.write_to_monitor(addr_a, din_a);
        end else if (we_a == 1) begin
            // $display($sformatf("output a: %2h, addr_a: %d", dout_a, addr_a));
            output_monitor_h.write_to_monitor(addr_a, dout_a);
        end
    end
endinterface
