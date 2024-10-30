`timescale 1ps/1ps
interface sfifo_interface;
  `include "uvm_macros.svh"

  import uvm_pkg::*;
  import sfifo_pkg::*;

  bit clk;
  bit reset;
  bit wr_en;
  bit rd_en;
  bit [7:0] input_data;
  bit full;
  bit [7:0] output_data;
  bit empty;

  initial begin
    clk = 1;
    forever begin
      #10;
      clk = ~clk;
    end
  end

  task reset_sfifo();
    reset = 1'b1;
    @(negedge clk);
    @(negedge clk);
    reset = 1'b0;
  endtask

  task send_req(
    input bit i_wr_en,
    input bit i_rd_en,
    input bit [7:0] i_input_data
  );
    // @(negedge clk);
    if (i_wr_en) begin
      wr_en = 1'b1;
      input_data = i_input_data;
      @(negedge clk);
      wr_en = 1'b0;
    end else if (i_rd_en) begin
      rd_en = 1'b1;
      @(negedge clk);
      rd_en = 1'b0;
    end
  endtask

  sfifo_monitor sfifo_monitor_h;

  always @(negedge clk) begin
    // @(negedge clk);
    if (wr_en) begin
      // $display($sformatf("time: %t input_data: %2h", $time, input_data));
      sfifo_monitor_h.write_to_coverage(input_data);
    end else begin
      // $display($sformatf("time: %t output_data: %2h", $time, output_data));
      sfifo_monitor_h.write_to_scoreboard(output_data);
    end
  end

  // clocking drv_cb @(negedge clk);
  //   default input #1 output #1;
  //   output wr_en;
  //   output rd_en;
  //   output input_data;
  //   input empty;
  //   input full;
  //   input output_data;
  // endclocking

  // clocking mon_cb @(negedge clk);
  //   default input #1 output #1;
  //   input wr_en;
  //   input rd_en;
  //   input input_data;
  //   input empty;
  //   input full;
  //   input output_data;
  // endclocking

  // modport drv_mp (input clk, reset, clocking drv_cb);
  // modport mon_mp (input clk, reset, clocking mon_cb);
endinterface
