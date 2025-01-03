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

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info("TEST", $sformatf("\n\
        #################################\n\
            TESTNAME: %s \n\
        #################################",
        get_type_name()), UVM_MEDIUM)
    endfunction

    function void final_phase(uvm_phase phase);
        `uvm_info("TEST", $sformatf("\n\
        --------------------------------------\n\
        |   Simulation for verification Done!.\n\
        |   -- %s \n\
        --------------------------------------",
        get_type_name()), UVM_MEDIUM)
    endfunction
endclass
