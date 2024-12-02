class spi_test extends uvm_test;
    `uvm_component_utils(spi_test)

    spi_sequencer spi_sequencer_h;
    spi_env spi_env_h;
    spi_sequence spi_sequence_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        spi_env_h = spi_env::type_id::create("spi_env_h", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        spi_sequencer_h = spi_env_h.spi_agent_h.spi_sequencer_h;
    endfunction

    task reset_phase(uvm_phase phase);
        phase.raise_objection(this);
        rstn <= 1;
        @(posedge clock);
        rstn <= 0;
        @(posedge clock);
        phase.drop_objection(this);
    endtask

    task main_phase(uvm_phase phase);
        spi_sequence_h = spi_sequence::type_id::create("spi_sequence_h");
        phase.raise_objection(this);
        #130;
        spi_sequence_h.start(spi_sequencer_h);
        phase.drop_objection(this);
    endtask
endclass
