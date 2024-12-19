`timescale 1ns/1ns
interface dma_interface;
  `include "uvm_macros.svh"

  import uvm_pkg::*;
  import dma_pkg::*;

  bit clk;
  bit reset;
  bit [31:0] addr;
  bit wr_en;
  bit valid;
  bit [31:0] wdata;
  bit [31:0] rdata;

  initial begin
    clk = 0;
    forever begin
      #5;
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
    input bit [31:0] i_addr,
    input bit i_wr_en,
    input [31:0] i_wdata,
    output [31:0] o_rdata
  );
    wr_en = 0;

    @(posedge clk);
    addr = i_addr;
    valid = 1;
    wr_en = i_wr_en;

    if (i_wr_en) begin
        wdata = i_wdata;
        @(posedge clk);
    end else begin
        @(posedge clk);
        wr_en = 0;
        @(posedge clk);
        o_rdata = rdata;
    end
    valid = 0;
  endtask

  dma_monitor dma_monitor_h;

  initial begin
      forever begin
          @(posedge clk);
          if (valid) begin
              if (wr_en) begin
                dma_monitor_h.write_to_coverage(
                    .addr(addr),
                    .wr_en(wr_en),
                    .wdata(wdata),
                    .rdata(rdata)
                );
                @(posedge clk); 
            end else begin
                @(posedge clk);
                @(posedge clk);
                dma_monitor_h.write_to_coverage(
                    .addr(addr),
                    .wr_en(wr_en),
                    .wdata(wdata),
                    .rdata(rdata)
                );
            end
          end
      end
  end
endinterface
