class spi_sequence extends uvm_sequence #(spi_seq_item);
    `uvm_object_utils(spi_sequence)

    spi_seq_item req;
    function new(string name="spi_sequence");
        super.new(name);
    endfunction

    task body();
        repeat (50) begin
            req = spi_seq_item::type_id::create("req");
            start_item(req);
            configure_dut_register();
            set_dut_data();
            finish_item(req);
        end
    endtask

    function void configure_dut_register();
        assert (req.randomize() with {
            req.master_ctrl_reg == 32'h00002208; // 32'b0010 0010 0000 1000
            req.slave_ctrl_reg == 32'h00000200;
            req.divider_reg == 32'h00000000;
            req.slave_select_reg == 32'h00000001;
            req.start_dut_reg == 32'h00000320; // 32'b0000 0011 0010 0000
            // CTRL[9]=1, CTRL[8]=1, CTRL[5]=1
            // CHAR_LEN=32 bits
            // GO_BSY: writing 1 to this bit starts the transfer
            // Rx_NEG : miso signal is latched
        });
    endfunction

    function void set_dut_data();
        assert (req.randomize() with {
            req.divider_reg == 32'h00000000;
            req.master_ctrl_reg == 32'h00002208;
            req.slave_ctrl_reg == 32'h00000200;
            req.slave_select_reg == 32'h00000001;
            req.start_dut_reg == 32'h00000320;
            req.exp_master_data == req.in_slave_data;
            req.exp_slave_data == req.in_master_data;
        });
    endfunction
endclass
