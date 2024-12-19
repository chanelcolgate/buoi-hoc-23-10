class dma_driver extends uvm_driver #(dma_seq_item);
  `uvm_component_utils(dma_driver)

  virtual dma_interface vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual dma_interface)::get(this, "", "vif", vif))
      `uvm_fatal("DMA_DIRVER", "Failed to get VIF")
  endfunction

  task run_phase(uvm_phase phase);
    dma_seq_item req;

    vif.reset_dma();
    forever begin
      logic [31:0] rdata;
      seq_item_port.get_next_item(req);
      vif.drive(req.addr, req.wr_en, req.wdata, rdata);
      req.rdata = rdata;
      seq_item_port.item_done();
    end
  endtask
endclass
