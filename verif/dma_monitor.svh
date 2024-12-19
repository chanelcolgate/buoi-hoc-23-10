class dma_monitor extends uvm_monitor;
  `uvm_component_utils(dma_monitor)

  virtual dma_interface vif;
  uvm_analysis_port #(dma_seq_item) item_collected_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual dma_interface)::get(this, "", "vif", vif))
      `uvm_fatal("SFIFO_MONITOR", "Failed to get VIF")

    item_collected_port = new("item_collected_port", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    vif.dma_monitor_h = this;
  endfunction

  function void write_to_coverage(
      bit [31:0] addr,
      bit wr_en,
      bit [31:0] wdata,
      bit [31:0] rdata
  );
    dma_seq_item trans_collected;

    trans_collected = dma_seq_item::type_id::create("trans_collected");

    trans_collected.addr = addr;
    trans_collected.wr_en = wr_en;
    trans_collected.wdata = wdata;
    trans_collected.rdata = rdata;
    item_collected_port.write(trans_collected);
  endfunction
endclass
