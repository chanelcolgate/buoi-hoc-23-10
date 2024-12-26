class uart_out_seq_item extends uvm_sequence_item;
    `uvm_object_utils(uart_out_seq_item)

    bit [31:0] uart_tx_dout;

    function new(string name="uart_out_seq_item");
        super.new(name);
    endfunction
endclass
