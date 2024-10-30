class sfifo_environment extends uvm_env;
  `uvm_component_utils(sfifo_environment)

  sfifo_agent sfifo_agent_h;
  sfifo_coverage sfifo_coverage_h;
  sfifo_scoreboard sfifo_scoreboard_h;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    sfifo_agent_h = sfifo_agent::type_id::create("sfifo_agent_h", this);
    sfifo_coverage_h = sfifo_coverage::type_id::create("sfifo_coverage_h", this);
    sfifo_scoreboard_h = sfifo_scoreboard::type_id::create("sfifo_scoreboard_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    sfifo_agent_h.sfifo_monitor_h.input_port.connect(sfifo_coverage_h.analysis_export);
    sfifo_agent_h.sfifo_monitor_h.input_port.connect(sfifo_scoreboard_h.input_port.analysis_export);
    sfifo_agent_h.sfifo_monitor_h.output_port.connect(sfifo_scoreboard_h.analysis_export);
  endfunction
endclass
