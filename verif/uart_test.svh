class uart_test extends uvm_test;
    `uvm_component_utils(uart_test)

    uart_sequencer uart_sequencer_h;
    uart_environment uart_environment_h;
    uart_sequence uart_sequence_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        uart_environment_h = uart_environment::type_id::create("uart_environment_h", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        uart_sequencer_h = uart_environment_h.uart_agent_h.uart_sequencer_h;
    endfunction

    task run_phase(uvm_phase phase);
        uart_sequence_h = uart_sequence::type_id::create("uart_sequence_h");
        phase.raise_objection(this);
        uart_sequencer_h.start(uart_sequencer_h);
        phase.drop_objection(this);
    endtask
endclass
