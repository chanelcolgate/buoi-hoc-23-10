// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Dec 11 03:08:58 2024
// Host        : DESKTOP-9O9Q58P running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -sdf_anno true postSynth_netlist.v -force
// Design      : sync_fifo
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010iclg225-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module RAM32M_UNIQ_BASE_
   (DOA,
    DOB,
    DOC,
    DOD,
    ADDRA,
    ADDRB,
    ADDRC,
    ADDRD,
    DIA,
    DIB,
    DIC,
    DID,
    WCLK,
    WE);
  output [1:0]DOA;
  output [1:0]DOB;
  output [1:0]DOC;
  output [1:0]DOD;
  input [4:0]ADDRA;
  input [4:0]ADDRB;
  input [4:0]ADDRC;
  input [4:0]ADDRD;
  input [1:0]DIA;
  input [1:0]DIB;
  input [1:0]DIC;
  input [1:0]DID;
  input WCLK;
  input WE;

  wire ADDRA0;
  wire ADDRA1;
  wire ADDRA2;
  wire ADDRA3;
  wire ADDRA4;
  wire ADDRB0;
  wire ADDRB1;
  wire ADDRB2;
  wire ADDRB3;
  wire ADDRB4;
  wire ADDRC0;
  wire ADDRC1;
  wire ADDRC2;
  wire ADDRC3;
  wire ADDRC4;
  wire ADDRD0;
  wire ADDRD1;
  wire ADDRD2;
  wire ADDRD3;
  wire ADDRD4;
  wire DIA0;
  wire DIA1;
  wire DIB0;
  wire DIB1;
  wire DIC0;
  wire DIC1;
  wire DID0;
  wire DID1;
  wire DOA0;
  wire DOA1;
  wire DOB0;
  wire DOB1;
  wire DOC0;
  wire DOC1;
  wire DOD0;
  wire DOD1;
  wire WCLK;
  wire WE;

  assign ADDRA0 = ADDRA[0];
  assign ADDRA1 = ADDRA[1];
  assign ADDRA2 = ADDRA[2];
  assign ADDRA3 = ADDRA[3];
  assign ADDRA4 = ADDRA[4];
  assign ADDRB0 = ADDRB[0];
  assign ADDRB1 = ADDRB[1];
  assign ADDRB2 = ADDRB[2];
  assign ADDRB3 = ADDRB[3];
  assign ADDRB4 = ADDRB[4];
  assign ADDRC0 = ADDRC[0];
  assign ADDRC1 = ADDRC[1];
  assign ADDRC2 = ADDRC[2];
  assign ADDRC3 = ADDRC[3];
  assign ADDRC4 = ADDRC[4];
  assign ADDRD0 = ADDRD[0];
  assign ADDRD1 = ADDRD[1];
  assign ADDRD2 = ADDRD[2];
  assign ADDRD3 = ADDRD[3];
  assign ADDRD4 = ADDRD[4];
  assign DIA0 = DIA[0];
  assign DIA1 = DIA[1];
  assign DIB0 = DIB[0];
  assign DIB1 = DIB[1];
  assign DIC0 = DIC[0];
  assign DIC1 = DIC[1];
  assign DID0 = DID[0];
  assign DID1 = DID[1];
  assign DOA[1] = DOA1;
  assign DOA[0] = DOA0;
  assign DOB[1] = DOB1;
  assign DOB[0] = DOB0;
  assign DOC[1] = DOC1;
  assign DOC[0] = DOC0;
  assign DOD[1] = DOD1;
  assign DOD[0] = DOD0;
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA
       (.CLK(WCLK),
        .I(DIA0),
        .O(DOA0),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA_D1
       (.CLK(WCLK),
        .I(DIA1),
        .O(DOA1),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB
       (.CLK(WCLK),
        .I(DIB0),
        .O(DOB0),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB_D1
       (.CLK(WCLK),
        .I(DIB1),
        .O(DOB1),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC
       (.CLK(WCLK),
        .I(DIC0),
        .O(DOC0),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC_D1
       (.CLK(WCLK),
        .I(DIC1),
        .O(DOC1),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID0),
        .O(DOD0),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD_D1
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID1),
        .O(DOD1),
        .WE(WE));
endmodule

module RAM32X1D_UNIQ_BASE_
   (DPO,
    SPO,
    A0,
    A1,
    A2,
    A3,
    A4,
    D,
    DPRA0,
    DPRA1,
    DPRA2,
    DPRA3,
    DPRA4,
    WCLK,
    WE);
  output DPO;
  output SPO;
  input A0;
  input A1;
  input A2;
  input A3;
  input A4;
  input D;
  input DPRA0;
  input DPRA1;
  input DPRA2;
  input DPRA3;
  input DPRA4;
  input WCLK;
  input WE;

  wire A0;
  wire A1;
  wire A2;
  wire A3;
  wire A4;
  wire D;
  wire DPO;
  wire DPRA0;
  wire DPRA1;
  wire DPRA2;
  wire DPRA3;
  wire DPRA4;
  wire SPO;
  wire WCLK;
  wire WE;

  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    DP
       (.CLK(WCLK),
        .I(D),
        .O(DPO),
        .RADR0(DPRA0),
        .RADR1(DPRA1),
        .RADR2(DPRA2),
        .RADR3(DPRA3),
        .RADR4(DPRA4),
        .WADR0(A0),
        .WADR1(A1),
        .WADR2(A2),
        .WADR3(A3),
        .WADR4(A4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    SP
       (.CLK(WCLK),
        .I(D),
        .O(SPO),
        .RADR0(A0),
        .RADR1(A1),
        .RADR2(A2),
        .RADR3(A3),
        .RADR4(A4),
        .WADR0(A0),
        .WADR1(A1),
        .WADR2(A2),
        .WADR3(A3),
        .WADR4(A4),
        .WE(WE));
endmodule

module RAM32X1D_HD1
   (DPO,
    SPO,
    A0,
    A1,
    A2,
    A3,
    A4,
    D,
    DPRA0,
    DPRA1,
    DPRA2,
    DPRA3,
    DPRA4,
    WCLK,
    WE);
  output DPO;
  output SPO;
  input A0;
  input A1;
  input A2;
  input A3;
  input A4;
  input D;
  input DPRA0;
  input DPRA1;
  input DPRA2;
  input DPRA3;
  input DPRA4;
  input WCLK;
  input WE;

  wire A0;
  wire A1;
  wire A2;
  wire A3;
  wire A4;
  wire D;
  wire DPO;
  wire DPRA0;
  wire DPRA1;
  wire DPRA2;
  wire DPRA3;
  wire DPRA4;
  wire SPO;
  wire WCLK;
  wire WE;

  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    DP
       (.CLK(WCLK),
        .I(D),
        .O(DPO),
        .RADR0(DPRA0),
        .RADR1(DPRA1),
        .RADR2(DPRA2),
        .RADR3(DPRA3),
        .RADR4(DPRA4),
        .WADR0(A0),
        .WADR1(A1),
        .WADR2(A2),
        .WADR3(A3),
        .WADR4(A4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    SP
       (.CLK(WCLK),
        .I(D),
        .O(SPO),
        .RADR0(A0),
        .RADR1(A1),
        .RADR2(A2),
        .RADR3(A3),
        .RADR4(A4),
        .WADR0(A0),
        .WADR1(A1),
        .WADR2(A2),
        .WADR3(A3),
        .WADR4(A4),
        .WE(WE));
endmodule

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

initial begin
 $sdf_annotate("postSynth_netlist.sdf",,,,"tool_control");
end
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
  (* INIT_A = "64'h0000000000000000" *) 
  (* INIT_B = "64'h0000000000000000" *) 
  (* INIT_C = "64'h0000000000000000" *) 
  (* INIT_D = "64'h0000000000000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "static_mem_reg_0_15_0_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M_UNIQ_BASE_ static_mem_reg_0_15_0_5
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
  (* INIT = "32'h00000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "static_mem_reg_0_15_6_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D_UNIQ_BASE_ static_mem_reg_0_15_6_7
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
  (* INIT = "32'h00000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "static_mem_reg_0_15_6_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D_HD1 static_mem_reg_0_15_6_7__0
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
