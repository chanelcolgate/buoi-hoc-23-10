class read_sequence extends uvm_sequence #(dma_seq_item);
    `uvm_object_utils(read_sequence)

    bit [31:0] t_addr;

    function new(string name="read_sequence");
        super.new(name);
    endfunction

    task body();
        dma_seq_item req;

        req = dma_seq_item::type_id::create("dma_seq_item");
        start_item(req);
        assert (req.randomize() with {
            req.wr_en == 0;
            req.addr == t_addr;
        });
        finish_item(req);
    endtask
endclass
