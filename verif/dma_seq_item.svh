class dma_seq_item extends uvm_sequence_item;
  `uvm_object_utils(dma_seq_item)

  rand bit [31:0]  addr;
  rand bit wr_en;
  rand bit [31:0] wdata;
  bit [31:0] rdata;

  function new(string name = "dma_seq_item");
    super.new(name);
  endfunction
endclass
