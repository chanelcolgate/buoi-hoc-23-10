class uart_sequence extends uvm_sequence #(uart_in_seq_item);
    `uvm_object_utils(uart_sequence)

    function new(string name);
        super.new(name);
    endfunction

    task body();
        uart_in_seq_item req;

        req = uart_in_seq_item::type_id::create("req");
        start_item(req);
        assert(req.randomize());
        finish_item(req);
    endtask
endclass
