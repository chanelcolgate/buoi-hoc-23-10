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
endclass
