`timescale 1ps/1ps
module tdpram_tester_module(tdpram_interface tif);
    function byte get_data();
        return $random;
    endfunction

    initial begin
        tif.reset_tdpram();
        tif.we_a = 1'b1;
        tif.we_b = 1'b0;

        $display("Write and Read Port A");
        for (int i=0; i<=5; i++) begin
            @(posedge tif.clk);
            tif.we_a = 1'b0;
            tif.addr_a = i;
            tif.din_a = get_data();
            // $display($sformatf("input a: %2h", tif.din_a));
            @(posedge tif.clk);
            tif.we_a = 1'b1;
            tif.addr_a = tif.addr_a;
        end
        tif.reset_tdpram();
        tif.we_a = 1'b1;
        tif.we_b = 1'b1;

        $display("Write Port A and Read Port B");
        for (int i=0; i<=5; i++) begin
            tif.we_a = 1'b0;
            tif.addr_a = i;
            tif.din_a = get_data();
            // $display($sformatf("input a: %2h", tif.din_a));
            @(posedge tif.clk);
            tif.we_b = 1'b1;
            tif.addr_b = tif.addr_a;
        end
        $stop;
    end

    // always @(posedge tif.clk) begin
    //     if (tif.we_a == 1)
    //         $display($sformatf("output a: %2h", tif.dout_a));
    //     else if (tif.we_a == 0 && tif.we_b == 1)
    //         $display($sformatf("output b: %2h", tif.dout_b));
    // end
endmodule
