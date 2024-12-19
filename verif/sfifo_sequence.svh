class dma_sequence extends uvm_sequence#(dma_seq_item);
  `uvm_object_utils(dma_sequence)

  function new(string name = "dma_sequence");
    super.new(name);
  endfunction

  task body();
    dma_seq_item req;

    `uvm_info(
      "SFIFO_SEQUENCE",
      "******* GENERATE 20 RANDOM REQS ********",
      UVM_LOW
    )
    repeat (20) begin
      req = dma_seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end
  endtask
endclass
