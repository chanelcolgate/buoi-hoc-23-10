class api_write_sequence extends uvm_sequence #(reg_in_item);
    `uvm_object_utils(api_write_sequence)

    int val_addr, val_data;

    function new(string name);
        super.new(name);
    endfunction

    task body();
        reg_in_item req;

        req = reg_in_item::type_id::create("req");
        start_item(req);
        req.val_addr = val_addr;
        req.val_data = val_data;
        finish_item(req);
    endtask
endclass
