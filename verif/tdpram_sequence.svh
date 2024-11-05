class tdpram_sequence extends uvm_sequence#(port_A_seq_item);
    `uvm_object_utils(tdpram_sequence)

    function new(string name = "tdpram_sequence");
        super.new(name);
    endfunction

    task body();
        port_A_seq_item req;

        `uvm_info(
            "TDPRAM_SEQUENCE",
            "******* GENERATE 20 RANDOM REQS ********",
            UVM_LOW
        )
        repeat (20) begin
            req = port_A_seq_item::type_id::create("req");
            start_item(req);
            assert(req.randomize());
            finish_item(req);
        end
    endtask
endclass
