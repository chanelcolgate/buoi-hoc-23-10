module dma #(parameter WIDTH_p = 32) (
    input logic clk,
    input logic reset,
    input logic [WIDTH_p-1:0] addr,
    input logic wr_en,
    input logic [WIDTH_p-1:0] wdata,
    output logic [WIDTH_p-1:0] rdata
);
logic [31:0] t_data;

reg [31:0] intr;
reg [31:0] control;
reg [31:0] io_address;
reg [31:0] mem_address;

always @(posedge clk) begin
    intr        <= 0;
    control     <= 0;
    io_address  <= 0;
    mem_address <= 0;
end

assign rdata = t_data;

always @(posedge clk) begin
    if (wr_en) begin
        if (addr == 32'h400) intr               <= wdata;
        else if (addr == 32'h404) control       <= wdata;
        else if (addr == 32'h408) io_address    <= wdata;
        else if (addr == 32'h40C) mem_address   <= wdata;
    end else if (!wr_en) begin
        if (addr == 32'h400) t_data         <= intr;
        else if (addr == 32'h404) t_data    <= control;
        else if (addr == 32'h408) t_data    <= io_address;
        else if (addr == 32'h40C) t_data    <= mem_address;
    end
end
endmodule
