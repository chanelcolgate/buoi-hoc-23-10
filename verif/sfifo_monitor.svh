class sfifo_monitor extends uvm_monitor;
  `uvm_component_utils(sfifo_monitor)

  virtual sfifo_interface vif;
  uvm_analysis_port #(sfifo_seq_item) input_port;
  uvm_analysis_port #(sfifo_seq_item) output_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual sfifo_interface)::get(this, "", "vif", vif))
      `uvm_fatal("SFIFO_MONITOR", "Failed to get VIF")

    input_port = new("input_port", this);
    output_port = new("output_port", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    vif.sfifo_monitor_h = this;
  endfunction

  function void write_to_coverage(byte unsigned input_data);
    sfifo_seq_item input_t;

    input_t = sfifo_seq_item::type_id::create("input_t");

    input_t.input_data = input_data;
    input_port.write(input_t);
    output_port.write(input_t);
  endfunction

  function void write_to_scoreboard(byte unsigned output_data);
    sfifo_seq_item output_t;

    output_t = sfifo_seq_item::type_id::create("output_t");

    output_t.output_data = output_data;
    output_port.write(output_t);
  endfunction
endclass
