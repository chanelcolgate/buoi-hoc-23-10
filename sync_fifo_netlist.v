// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Thu Nov 21 15:46:15 2024
// Host        : DESKTOP-9O9Q58P running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim sync_fifo_netlist.v
// Design      : sync_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.  // Device      : xc7z010iclg225-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DEPTH = "16" *) (* POINTER_WIDTH = "4" *) (* WIDTH = "8" *) 
(* NotValidForBitStream *)
module sync_fifo
   (clk,
    reset,
    wr_en,
    rd_en,
    input_data,
    empty,
    full,
    output_data);
  input clk;
  input reset;
  input wr_en;
  input rd_en;
  input [7:0]input_data;
  output empty;
  output full;
  output [7:0]output_data;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire empty;
  wire empty_OBUF;
  wire empty_i_1_n_0;
  wire full;
  wire full_OBUF;
  wire full_i_1_n_0;
  wire full_i_2_n_0;
  wire get_e;
  wire [7:0]input_data;
  wire [7:0]input_data_IBUF;
  wire [7:0]output_data;
  wire [3:1]output_data1;
  wire [7:0]output_data_OBUF;
  wire [4:2]p_0_in;
  wire [4:0]p_0_in__0;
  wire p_1_in;
  wire put_e;
  wire rd_en;
  wire rd_en_IBUF;
  wire \rd_ptr[1]_i_1_n_0 ;
  wire [4:0]rd_ptr_reg;
  wire reset;
  wire reset_IBUF;
  wire static_mem_reg_0_15_0_5_i_5_n_0;
  wire wr_en;
  wire wr_en_IBUF;
  wire \wr_ptr_reg_n_0_[0] ;
  wire \wr_ptr_reg_n_0_[1] ;
  wire \wr_ptr_reg_n_0_[2] ;
  wire \wr_ptr_reg_n_0_[3] ;
  wire \wr_ptr_reg_n_0_[4] ;
  wire [1:0]NLW_static_mem_reg_0_15_0_5_DOD_UNCONNECTED;
  wire NLW_static_mem_reg_0_15_6_7_SPO_UNCONNECTED;
  wire NLW_static_mem_reg_0_15_6_7__0_SPO_UNCONNECTED;

  // always @(negedge clk)
  //     $display("output_data %2h", output_data);


  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF empty_OBUF_inst
       (.I(empty_OBUF),
        .O(empty));
  LUT6 #(
    .INIT(64'h0000000080204010)) 
    empty_i_1
       (.I0(rd_ptr_reg[4]),
        .I1(rd_ptr_reg[3]),
        .I2(full_i_2_n_0),
        .I3(\wr_ptr_reg_n_0_[3] ),
        .I4(\wr_ptr_reg_n_0_[4] ),
        .I5(reset_IBUF),
        .O(empty_i_1_n_0));
  FDRE empty_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(empty_i_1_n_0),
        .Q(empty_OBUF),
        .R(1'b0));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  LUT6 #(
    .INIT(64'h0000000040080840)) 
    full_i_1
       (.I0(rd_ptr_reg[3]),
        .I1(full_i_2_n_0),
        .I2(\wr_ptr_reg_n_0_[3] ),
        .I3(rd_ptr_reg[4]),
        .I4(\wr_ptr_reg_n_0_[4] ),
        .I5(reset_IBUF),
        .O(full_i_1_n_0));
  LUT6 #(
    .INIT(64'h8008200240041001)) 
    full_i_2
       (.I0(\wr_ptr_reg_n_0_[2] ),
        .I1(rd_ptr_reg[1]),
        .I2(\wr_ptr_reg_n_0_[0] ),
        .I3(rd_ptr_reg[0]),
        .I4(\wr_ptr_reg_n_0_[1] ),
        .I5(rd_ptr_reg[2]),
        .O(full_i_2_n_0));
  FDRE full_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(full_i_1_n_0),
        .Q(full_OBUF),
        .R(1'b0));
  IBUF \input_data_IBUF[0]_inst 
       (.I(input_data[0]),
        .O(input_data_IBUF[0]));
  IBUF \input_data_IBUF[1]_inst 
       (.I(input_data[1]),
        .O(input_data_IBUF[1]));
  IBUF \input_data_IBUF[2]_inst 
       (.I(input_data[2]),
        .O(input_data_IBUF[2]));
  IBUF \input_data_IBUF[3]_inst 
       (.I(input_data[3]),
        .O(input_data_IBUF[3]));
  IBUF \input_data_IBUF[4]_inst 
       (.I(input_data[4]),
        .O(input_data_IBUF[4]));
  IBUF \input_data_IBUF[5]_inst 
       (.I(input_data[5]),
        .O(input_data_IBUF[5]));
  IBUF \input_data_IBUF[6]_inst 
       (.I(input_data[6]),
        .O(input_data_IBUF[6]));
  IBUF \input_data_IBUF[7]_inst 
       (.I(input_data[7]),
        .O(input_data_IBUF[7]));
  OBUF \output_data_OBUF[0]_inst 
       (.I(output_data_OBUF[0]),
        .O(output_data[0]));
  OBUF \output_data_OBUF[1]_inst 
       (.I(output_data_OBUF[1]),
        .O(output_data[1]));
  OBUF \output_data_OBUF[2]_inst 
       (.I(output_data_OBUF[2]),
        .O(output_data[2]));
  OBUF \output_data_OBUF[3]_inst 
       (.I(output_data_OBUF[3]),
        .O(output_data[3]));
  OBUF \output_data_OBUF[4]_inst 
       (.I(output_data_OBUF[4]),
        .O(output_data[4]));
  OBUF \output_data_OBUF[5]_inst 
       (.I(output_data_OBUF[5]),
        .O(output_data[5]));
  OBUF \output_data_OBUF[6]_inst 
       (.I(output_data_OBUF[6]),
        .O(output_data[6]));
  OBUF \output_data_OBUF[7]_inst 
       (.I(output_data_OBUF[7]),
        .O(output_data[7]));
  IBUF rd_en_IBUF_inst
       (.I(rd_en),
        .O(rd_en_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_ptr[1]_i_1 
       (.I0(rd_ptr_reg[1]),
        .I1(rd_ptr_reg[0]),
        .O(\rd_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rd_ptr[2]_i_1 
       (.I0(rd_ptr_reg[2]),
        .I1(rd_ptr_reg[1]),
        .I2(rd_ptr_reg[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rd_ptr[3]_i_1 
       (.I0(rd_ptr_reg[3]),
        .I1(rd_ptr_reg[1]),
        .I2(rd_ptr_reg[0]),
        .I3(rd_ptr_reg[2]),
        .O(p_0_in[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \rd_ptr[4]_i_1 
       (.I0(rd_en_IBUF),
        .I1(empty_OBUF),
        .O(get_e));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \rd_ptr[4]_i_2 
       (.I0(rd_ptr_reg[4]),
        .I1(rd_ptr_reg[2]),
        .I2(rd_ptr_reg[0]),
        .I3(rd_ptr_reg[1]),
        .I4(rd_ptr_reg[3]),
        .O(p_0_in[4]));
  FDRE \rd_ptr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(get_e),
        .D(static_mem_reg_0_15_0_5_i_5_n_0),
        .Q(rd_ptr_reg[0]),
        .R(reset_IBUF));
  FDRE \rd_ptr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(get_e),
        .D(\rd_ptr[1]_i_1_n_0 ),
        .Q(rd_ptr_reg[1]),
        .R(reset_IBUF));
  FDRE \rd_ptr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(get_e),
        .D(p_0_in[2]),
        .Q(rd_ptr_reg[2]),
        .R(reset_IBUF));
  FDRE \rd_ptr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(get_e),
        .D(p_0_in[3]),
        .Q(rd_ptr_reg[3]),
        .R(reset_IBUF));
  FDRE \rd_ptr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(get_e),
        .D(p_0_in[4]),
        .Q(rd_ptr_reg[4]),
        .R(reset_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "static_mem_reg_0_15_0_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M static_mem_reg_0_15_0_5
       (.ADDRA({1'b0,output_data1,static_mem_reg_0_15_0_5_i_5_n_0}),
        .ADDRB({1'b0,output_data1,static_mem_reg_0_15_0_5_i_5_n_0}),
        .ADDRC({1'b0,output_data1,static_mem_reg_0_15_0_5_i_5_n_0}),
        .ADDRD({1'b0,\wr_ptr_reg_n_0_[3] ,\wr_ptr_reg_n_0_[2] ,\wr_ptr_reg_n_0_[1] ,\wr_ptr_reg_n_0_[0] }),
        .DIA(input_data_IBUF[1:0]),
        .DIB(input_data_IBUF[3:2]),
        .DIC(input_data_IBUF[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(output_data_OBUF[1:0]),
        .DOB(output_data_OBUF[3:2]),
        .DOC(output_data_OBUF[5:4]),
        .DOD(NLW_static_mem_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_1_in));
  LUT3 #(
    .INIT(8'h04)) 
    static_mem_reg_0_15_0_5_i_1
       (.I0(full_OBUF),
        .I1(wr_en_IBUF),
        .I2(reset_IBUF),
        .O(p_1_in));
  LUT4 #(
    .INIT(16'hAAA9)) 
    static_mem_reg_0_15_0_5_i_2
       (.I0(rd_ptr_reg[3]),
        .I1(rd_ptr_reg[1]),
        .I2(rd_ptr_reg[0]),
        .I3(rd_ptr_reg[2]),
        .O(output_data1[3]));
  LUT3 #(
    .INIT(8'hA9)) 
    static_mem_reg_0_15_0_5_i_3
       (.I0(rd_ptr_reg[2]),
        .I1(rd_ptr_reg[1]),
        .I2(rd_ptr_reg[0]),
        .O(output_data1[2]));
  LUT2 #(
    .INIT(4'h9)) 
    static_mem_reg_0_15_0_5_i_4
       (.I0(rd_ptr_reg[1]),
        .I1(rd_ptr_reg[0]),
        .O(output_data1[1]));
  LUT1 #(
    .INIT(2'h1)) 
    static_mem_reg_0_15_0_5_i_5
       (.I0(rd_ptr_reg[0]),
        .O(static_mem_reg_0_15_0_5_i_5_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "static_mem_reg_0_15_6_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D static_mem_reg_0_15_6_7
       (.A0(\wr_ptr_reg_n_0_[0] ),
        .A1(\wr_ptr_reg_n_0_[1] ),
        .A2(\wr_ptr_reg_n_0_[2] ),
        .A3(\wr_ptr_reg_n_0_[3] ),
        .A4(1'b0),
        .D(input_data_IBUF[6]),
        .DPO(output_data_OBUF[6]),
        .DPRA0(static_mem_reg_0_15_0_5_i_5_n_0),
        .DPRA1(output_data1[1]),
        .DPRA2(output_data1[2]),
        .DPRA3(output_data1[3]),
        .DPRA4(1'b0),
        .SPO(NLW_static_mem_reg_0_15_6_7_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_1_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "static_mem_reg_0_15_6_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D static_mem_reg_0_15_6_7__0
       (.A0(\wr_ptr_reg_n_0_[0] ),
        .A1(\wr_ptr_reg_n_0_[1] ),
        .A2(\wr_ptr_reg_n_0_[2] ),
        .A3(\wr_ptr_reg_n_0_[3] ),
        .A4(1'b0),
        .D(input_data_IBUF[7]),
        .DPO(output_data_OBUF[7]),
        .DPRA0(static_mem_reg_0_15_0_5_i_5_n_0),
        .DPRA1(output_data1[1]),
        .DPRA2(output_data1[2]),
        .DPRA3(output_data1[3]),
        .DPRA4(1'b0),
        .SPO(NLW_static_mem_reg_0_15_6_7__0_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_1_in));
  IBUF wr_en_IBUF_inst
       (.I(wr_en),
        .O(wr_en_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_ptr[0]_i_1 
       (.I0(\wr_ptr_reg_n_0_[0] ),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_ptr[1]_i_1 
       (.I0(\wr_ptr_reg_n_0_[1] ),
        .I1(\wr_ptr_reg_n_0_[0] ),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \wr_ptr[2]_i_1 
       (.I0(\wr_ptr_reg_n_0_[2] ),
        .I1(\wr_ptr_reg_n_0_[1] ),
        .I2(\wr_ptr_reg_n_0_[0] ),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \wr_ptr[3]_i_1 
       (.I0(\wr_ptr_reg_n_0_[3] ),
        .I1(\wr_ptr_reg_n_0_[1] ),
        .I2(\wr_ptr_reg_n_0_[0] ),
        .I3(\wr_ptr_reg_n_0_[2] ),
        .O(p_0_in__0[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_ptr[4]_i_1 
       (.I0(wr_en_IBUF),
        .I1(full_OBUF),
        .O(put_e));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \wr_ptr[4]_i_2 
       (.I0(\wr_ptr_reg_n_0_[4] ),
        .I1(\wr_ptr_reg_n_0_[2] ),
        .I2(\wr_ptr_reg_n_0_[0] ),
        .I3(\wr_ptr_reg_n_0_[1] ),
        .I4(\wr_ptr_reg_n_0_[3] ),
        .O(p_0_in__0[4]));
  FDRE \wr_ptr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(put_e),
        .D(p_0_in__0[0]),
        .Q(\wr_ptr_reg_n_0_[0] ),
        .R(reset_IBUF));
  FDRE \wr_ptr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(put_e),
        .D(p_0_in__0[1]),
        .Q(\wr_ptr_reg_n_0_[1] ),
        .R(reset_IBUF));
  FDRE \wr_ptr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(put_e),
        .D(p_0_in__0[2]),
        .Q(\wr_ptr_reg_n_0_[2] ),
        .R(reset_IBUF));
  FDRE \wr_ptr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(put_e),
        .D(p_0_in__0[3]),
        .Q(\wr_ptr_reg_n_0_[3] ),
        .R(reset_IBUF));
  FDRE \wr_ptr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(put_e),
        .D(p_0_in__0[4]),
        .Q(\wr_ptr_reg_n_0_[4] ),
        .R(reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
