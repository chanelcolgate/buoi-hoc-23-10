`timescale 1ns/10ps
interface dma_interface #(parameter WIDTH_p = 32);
    `include "uvm_macros.svh"

    import uvm_pkg::*;
    import dma_pkg::*;

    bit clk;
    bit reset;
    bit [WIDTH_p-1:0] addr;
    bit wr_en;
    bit [WIDTH_p-1:0] wdata;
    bit [WIDTH_p-1:0] rdata;

    bit valid;

    initial begin
        clk = 0;
        forever begin
            #10;
            clk = ~clk;
        end
    end

    task reset_dma();
        reset = 1'b1;
        @(posedge clk);
        @(posedge clk);
        reset = 1'b0;
    endtask

    task drive(
        input int i_val_addr,
        input int i_val_data,
        output int o_rd_data
    );
        @(posedge clk);
        addr = i_val_addr;
        wdata = i_val_data;
        wr_en = 1'b1;
        valid = 1'b1;
        @(posedge clk);
        wr_en = 1'b0;
        @(posedge clk);
        o_rd_data = rdata;
        valid = 1'b0;
    endtask

    in_monitor in_monitor_h;
    out_monitor out_monitor_h;

    initial begin
        forever begin
            @(posedge clk);
            @(posedge clk);
            if (valid) begin
                if (wr_en) begin
                    $display("Input");
                    $display(addr);
                    $display(wdata);
                    in_monitor_h.write_to_monitor(addr, wdata);
                    @(posedge clk);
                end
            end
        end
    end

    initial begin
        forever begin
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            $display("Here");
            $display(rdata);
            out_monitor_h.write_to_monitor(rdata);
            // if (valid) begin
            //     if (!wr_en) begin
            //     end
            // end
        end
    end
endinterface
