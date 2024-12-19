class dma_agent extends uvm_agent;
  `uvm_component_utils(dma_agent)

  dma_sequencer dma_sequencer_h;
  dma_driver dma_driver_h;
  dma_monitor dma_monitor_h;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      dma_sequencer_h = dma_sequencer::type_id::create("dma_sequencer_h", this);
      dma_driver_h = dma_driver::type_id::create("dma_driver_h", this);
    end
    dma_monitor_h = dma_monitor::type_id::create("dma_monitor_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      dma_driver_h.seq_item_port.connect(dma_sequencer_h.seq_item_export);
    end
  endfunction
endclass
