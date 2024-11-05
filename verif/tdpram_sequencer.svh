class tdpram_sequencer extends uvm_sequencer #(port_A_seq_item);
    `uvm_component_utils(tdpram_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass
