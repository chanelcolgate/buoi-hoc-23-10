class uart_agent extends uvm_agent;
    `uvm_component_utils(uart_agent)

    uart_sequencer uart_sequencer_h;
    uart_driver uart_driver_h;
    uart_in_monitor uart_in_monitor_h;
    uart_out_monitor uart_out_monitor_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function build_phase(uvm_phase phase);
        uart_sequencer_h = uart_sequencer::type_id::create("uart_sequencer_h", this);
        uart_driver_h = uart_driver::type_id::create("uart_driver_h", this);
        uart_in_monitor_h = uart_in_monitor::type_id::create("uart_in_monitor_h", this);
        uart_out_monitor_h = uart_out_monitor::type_id::create("uart_out_monitor_h", this);
    endfunction

    function connect_phase(uvm_phase phase);
        uart_driver_h.seq_item_port.connect(uart_sequencer_h.seq_item_export);
    endfunction
endclass
