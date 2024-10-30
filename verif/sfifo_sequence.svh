class sfifo_sequence extends uvm_sequence#(sfifo_seq_item);
  `uvm_object_utils(sfifo_sequence)

  function new(string name = "sfifo_sequence");
    super.new(name);
  endfunction

  task body();
    sfifo_seq_item req;

    `uvm_info(
      "SFIFO_SEQUENCE",
      "******* GENERATE 20 RANDOM REQS ********",
      UVM_LOW
    )
    repeat (20) begin
      req = sfifo_seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end
  endtask
endclass
