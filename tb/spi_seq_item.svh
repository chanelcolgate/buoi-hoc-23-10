class spi_seq_item extends uvm_sequence_item;
    `uvm_object_utils(spi_seq_item)

    // Register configuration:
    rand logic [31:0] master_ctrl_reg;
    rand logic [31:0] slave_ctrl_reg;
    rand logic [31:0] divider_reg;
    rand logic [31:0] slave_select_reg;
    rand logic [31:0] start_dut_reg;

    // Dut output:
    logic [31:0] out_master_data;
    logic [31:0] out_slave_data;

    // Expected data:
    rand logic [31:0] exp_master_data;
    rand logic [31:0] exp_slave_data;

    // DUT input:
    rand logic [31:0] in_master_data;
    rand logic [31:0] in_slave_data;

    function new(string name="spi_seq_item");
        super.new(name);
    endfunction

    function spi_seq_item clone_me();
        spi_seq_item clone;
        uvm_object tmp;

        tmp = this.clone();
        $cast(clone, tmp);
        return clone;
    endfunction

    function void do_copy(uvm_object rhs);
        spi_seq_item RHS;

        if (rhs == null)
            `uvm_fatal("SPI_SEQ_ITEM", "Tried to copy from a null pointer")

        super.do_copy(rhs);

        if (!$cast(RHS, rhs))
            `uvm_fatal("SPI_SEQ_ITEM", "Tried to copy a wrong type")

        master_ctrl_reg = RHS.master_ctrl_reg;
        slave_ctrl_reg = RHS.slave_ctrl_reg;
        divider_reg = RHS.divider_reg;
        slave_select_reg = RHS.slave_select_reg;
        start_dut_reg = RHS.start_dut_reg;
        out_master_data = RHS.out_master_data;
        out_slave_data = RHS.out_slave_data;
        exp_master_data = RHS.exp_master_data;
        exp_slave_data = RHS.exp_slave_data;
        in_master_data = RHS.in_master_data;
        in_slave_data = RHS.in_slave_data;
    endfunction
endclass
