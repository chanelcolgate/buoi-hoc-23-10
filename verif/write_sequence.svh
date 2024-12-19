class write_sequence extends uvm_sequence #(dma_seq_item);
    `uvm_object_utils(write_sequence)
    bit [31:0] t_addr;
    bit [31:0] t_data;

    function new(string name="write_sequence");
        super.new(name);
    endfunction

    task body();
        dma_seq_item req;
        
        req = dma_seq_item::type_id::create("req");
        start_item(req);
        assert (req.randomize() with {
            req.wr_en == 1;
            req.addr == t_addr;
            req.wdata == t_data;
        });
        finish_item(req);
    endtask
endclass
