class wb_bfm extends uvm_object;
    `uvm_object_utils(wb_bfm)

    function new(string name="wb_bfm");
        super.new(name);
    endfunction

    static task wb_reset(input spi_vif vif);
        vif.o_wb_addr <= {5{1'bx}};
        vif.o_wb_data <= {32{1'bx}};
        vif.o_wb_cyc <= 1'b0;
        vif.o_wb_stb <= 1'bx;
        vif.o_wb_we <= 1'bx;
        vif.o_wb_sel <= {4{1'bx}};
    endtask

    static task wb_read(
        input spi_vif vif,
        input integer delay,
        input logic [4:0] a,
        output logic [31:0] d
    );
        begin
            // wait initial delay
            repeat (delay) @(posedge vif.clock);
            // assert wishbone signals
            repeat (1) @(posedge vif.clock);
            vif.o_wb_addr <= a;
            vif.o_wb_data <= {32{1'bx}};
            vif.o_wb_cyc <= 1'b1;
            vif.o_wb_stb <= 1'b1;
            vif.o_wb_we <= 1'b0;
            vif.o_wb_sel <= {4{1'b1}};
            @(posedge vif.clock);
            // wait for acknowledge from slave
            wait (vif.i_wb_ack == 1'b1);
            // negate wishbone signals
            repeat (1) @(posedge vif.clock);
            vif.o_wb_cyc <= 1'b0;
            vif.o_wb_stb <= 1'bx;
            vif.o_wb_addr <= {5{1'bx}};
            vif.o_wb_data <= {32{1'bx}};
            vif.o_wb_we <= 1'bx;
            vif.o_wb_sel <= {4{1'bx}};
            d = vif.i_wb_data;
        end
    endtask

    static task wb_write(
        input spi_vif vif,
        input integer delay,
        input logic [4:0] a,
        input logic [31:0] d
    );
        begin
            // wait initial delay
            repeat (delay) @(posedge vif.clock);
            // assert wishbone signal
            vif.o_wb_addr <= a;
            vif.o_wb_data <= d;
            vif.o_wb_cyc <= 1'b1;
            vif.o_wb_stb <= 1'b1;
            vif.o_wb_we <= 1'b1;
            vif.o_wb_sel <= {4{1'b1}};
            @(posedge vif.clock);
            // wait for acknowledge from slave
            wait (vif.i_wb_ack == 1'b1);

            // negate wishbone signals
            repeat (2) @(posedge vif.clock);
            vif.o_wb_cyc <= 1'b0;
            vif.o_wb_stb <= 1'bx;
            vif.o_wb_addr <= {5{1'bx}};
            vif.o_wb_data <= {32{1'bx}};
            vif.o_wb_we <= 1'bx;
            vif.o_wb_sel <= {4{1'bx}};
        end
    endtask
endclass
