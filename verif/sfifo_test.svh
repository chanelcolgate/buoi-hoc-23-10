class sfifo_test extends uvm_test;
    `uvm_component_utils(sfifo_test)

    sfifo_sequencer sfifo_sequencer_h;
    sfifo_environment sfifo_environment_h;
    sfifo_sequence sfifo_sequence_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        sfifo_environment_h = sfifo_environment::type_id::create("sfifo_environment_h", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        sfifo_sequencer_h = sfifo_environment_h.sfifo_agent_h.sfifo_sequencer_h;
    endfunction

    task run_phase(uvm_phase phase);
        sfifo_sequence_h = sfifo_sequence::type_id::create("sfifo_sequence_h");
        phase.raise_objection(this);
        #130;
        sfifo_sequence_h.start(sfifo_sequencer_h);
        phase.drop_objection(this);
    endtask
endclass
