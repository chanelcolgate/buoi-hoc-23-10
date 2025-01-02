class dma_sequencer extends uvm_sequencer #(reg_in_item);
    `uvm_component_utils(dma_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass
