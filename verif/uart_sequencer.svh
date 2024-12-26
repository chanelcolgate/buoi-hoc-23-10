class uart_sequencer extends uvm_sequencer #(uart_in_initiator_s);
    `uvm_component_utils(uart_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass
