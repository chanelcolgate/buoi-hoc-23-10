class dma_environment extends uvm_env;
  `uvm_component_utils(dma_environment)

  dma_agent dma_agent_h;
  dma_coverage dma_coverage_h;
  // dma_scoreboard dma_scoreboard_h;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    dma_agent_h = dma_agent::type_id::create("dma_agent_h", this);
    dma_coverage_h = dma_coverage::type_id::create("dma_coverage_h", this);
    // dma_scoreboard_h = dma_scoreboard::type_id::create("dma_scoreboard_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    dma_agent_h.dma_monitor_h.item_collected_port.connect(dma_coverage_h.analysis_export);
    // dma_agent_h.dma_monitor_h.input_port.connect(dma_scoreboard_h.input_port.analysis_export);
    // dma_agent_h.dma_monitor_h.output_port.connect(dma_scoreboard_h.analysis_export);
  endfunction
endclass
