class dma_agent extends uvm_agent;
    `uvm_component_utils(dma_agent)

    dma_sequencer dma_sequencer_h;
    dma_driver dma_driver_h;
    in_monitor in_monitor_h;
    out_monitor out_monitor_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        dma_sequencer_h = dma_sequencer::type_id::create("dma_sequencer_h", this);
        dma_driver_h = dma_driver::type_id::create("dma_driver_h", this);
        in_monitor_h = in_monitor::type_id::create("in_monitor_h", this);
        out_monitor_h = out_monitor::type_id::create("out_monitor_h", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        dma_driver_h.seq_item_port.connect(dma_sequencer_h.seq_item_export);
    endfunction
endclass
