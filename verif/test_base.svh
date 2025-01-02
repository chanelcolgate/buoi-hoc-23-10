class test_base extends uvm_test;
    `uvm_component_utils(test_base)

    dma_sequencer dma_sequencer_h;
    dma_environment dma_environment_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        dma_environment_h = dma_environment::type_id::create("dma_environment_h", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        dma_sequencer_h = dma_environment_h.dma_agent_h.dma_sequencer_h;
    endfunction
endclass
