class sfifo_agent extends uvm_agent;
  `uvm_component_utils(sfifo_agent)

  sfifo_sequencer sfifo_sequencer_h;
  sfifo_driver sfifo_driver_h;
  sfifo_monitor sfifo_monitor_h;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      sfifo_sequencer_h = sfifo_sequencer::type_id::create("sfifo_sequencer_h", this);
      sfifo_driver_h = sfifo_driver::type_id::create("sfifo_driver_h", this);
    end
    sfifo_monitor_h = sfifo_monitor::type_id::create("sfifo_monitor_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    if (get_is_active() == UVM_ACTIVE) begin
      sfifo_driver_h.seq_item_port.connect(sfifo_sequencer_h.seq_item_export);
    end
  endfunction
endclass
