interface spi_interface(input bit clock);
    `include "uvm_macros.svh"

    import uvm_pkg::*;
    import spi_pkg::*;

    logic [4:0] o_wb_addr;  // lower address bits
    logic [31:0] i_wb_data; // data bus input
    logic [31:0] o_wb_data; // data bus output
    logic [3:0] o_wb_sel;   // select inputs
    logic o_wb_we;          // write enable input
    logic o_wb_stb;         // strobe / core select signal
    logic o_wb_cyc;         // valid bus cycle input
    logic i_wb_ack;         // bus cycle acknowledge output
    logic i_wb_err;         // termination w/ error
    logic i_wb_int;         // interrupt request signal output input
    logic tick;             // transfer in complete known
endinterface
