class uart_in_seq_item extends uvm_sequence_item;
    `uvm_object_utils(uart_in_seq_item)
    rand bit [7:0] tx_buffer_addr;
    rand bit tx_buffer_en_rd;
    rand bit tx_buffer_en_wr;
    rand bit [7:0] tx_num;
    rand bit [31:0] tx_buffer_data;

    function new(string name="uart_in_seq_item");
        super.new(name);
    endfunction
endclass
