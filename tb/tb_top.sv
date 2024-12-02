`timescale 1ns/1ps
module tb_top;
`include "uvm_macros.svh"

import uvm_pkg::*;
import spi_pkg::*;

spi_interface master (clock); // master interface declaration
spi_interface slave  (clock); // slave interface declaration 

logic spi_reset_out;
logic [22:0] counter;
logic spi_busy, spi_start;
logic tx_overrun;

// SPI master core:
spi spi_master (
    // UVM TB to DUT connection:
    .wb_clk_i(clock),
    .wb_rst_i(rstn),
    .wb_adr_i(master.o_wb_addr),
    .wb_dat_i(master.o_wb_data),
    .wb_sel_i(master.o_wb_sel),
    .wb_we_i(master.o_wb_we),
    .wb_stb_i(master.o_wb_stb),
    .wb_cyc_i(master.o_wb_cyc),
    .wb_dat_o(master.i_wb_data),
    .wb_ack_o(master.i_wb_ack),
    .wb_err_o(master.i_wb_err),
    .wb_int_o(master.i_wb_int),
    // master to slave connection:
    .ss_pad_o(ss),
    .sclk_pad_o(sclk),
    .mosi_pad_o(mosi),
    .miso_pad_i(miso),
    .tip(master.tick)
);

// wb_spi_slave spi_slave (
//     .clk(clock),
//     .rst(rstn),
//     .sck(sclk),
//     .ssn(ss[0]),
//     .mosi(mosi),
//     .miso(miso),
//     .o_wb_cyc(slave.o_wb_cyc),
//     .o_wb_stb(slave.o_wb_stb),
//     .o_wb_adr(slave.o_wb_addr),
//     .o_wb_dat(slave.o_wb_data),
//     .o_wb_we(slave.o_wb_we),
//     .i_wb_ack(slave.i_wb_ack),
//     .i_wb_dat(slave.i_wb_data),
//     .reset_out(spi_reset_out),
//     .spi_id(counter[22:15]),
//     .spi_status(counter[15:8]),
//     .spi_start(spi_start),
//     .spi_busy(spi_busy),
//     .tx_overrun(tx_overrun),
//     .*
// );

// SPI slave core:
spi_slave spi_slave (
    .wb_clk_i(clock),
    .wb_rst_i(rstn),
    .wb_adr_i(slave.o_wb_addr),
    .wb_dat_i(slave.o_wb_data),
    .wb_sel_i(slave.o_wb_sel),
    .wb_we_i(slave.o_wb_we),
    .wb_stb_i(slave.o_wb_stb),
    .wb_cyc_i(slave.o_wb_cyc),
    .wb_dat_o(slave.i_wb_data),
    .wb_ack_o(slave.i_wb_ack),
    .wb_err_o(slave.i_wb_err),
    .wb_int_o(slave.i_wb_int),
    // slave to master connection:
    .ss_pad_i(ss),
    .sclk_pad_i(sclk),
    .mosi_pad_i(mosi),
    .miso_pad_o(miso)
);

initial begin
    clock = 0;
    forever begin
        #10;
        clock = ~clock;
    end
end

task reset_dut();
    #110;
    rstn = 1'b0;
    #5;
    rstn = 1'b1;
    #2;
    rstn = 1'b0;
endtask

function void reg_2ints_to_config_db();
    uvm_config_db #(virtual spi_interface)::set(null, "*", "m_if", master);
    uvm_config_db #(virtual spi_interface)::set(null, "*", "s_if", slave);
endfunction

initial begin
    // reset_dut();
    reg_2ints_to_config_db();
    run_test();
end

endmodule
