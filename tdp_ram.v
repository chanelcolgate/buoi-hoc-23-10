module tdp_ram (
    clk,
    din_a,  // data in at port A
    din_b,  // data in at port B
    dout_a, // data out at port A
    dout_b, // data out at port B
    addr_a, // address in at port A
    addr_b, // address in at port B
    we_a,   // write enable at port A
    we_b,   // write enable at port B
    sclr    // synchronous clear/reset port; used to clear the registered data output ports.
);

    input clk;
    input [7:0] din_a, din_b;
    output [7:0] dout_a, dout_b;
    reg [7:0] dout_a, dout_b;
    input [5:0] addr_a, addr_b;
    input we_a, we_b;
    input sclr;

    // memory array
    reg [7:0] mem [0:63];

    always @(posedge clk) begin
        if (sclr == 1'b0) begin // reset_n
            dout_a <= 8'b0;
            dout_b <= 8'b0;
        end else if (we_a == 1'b0) // we_a == 0 -> write_enable 
        begin
            mem[addr_a] <= din_a;
            dout_a <= din_a;
        end
        else // we_a == 1 -> read_enable
            dout_a <= mem[addr_a];
    end

    always @(negedge clk) begin
        if (sclr == 1'b0) begin
            dout_a <= 8'b0;
            dout_b <= 8'b0;
        end else if (we_b == 1'b0)
        begin
            mem[addr_b] <= din_b;
            dout_b <= din_b;
        end
        else
            dout_b <= mem[addr_b];
    end
endmodule
