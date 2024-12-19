class dma_test extends uvm_test;
    `uvm_component_utils(dma_test)

    dma_sequencer dma_sequencer_h;
    dma_environment dma_environment_h;
    write_sequence write_sequence_h;
    read_sequence read_sequence_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        dma_environment_h = dma_environment::type_id::create("dma_environment_h", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        dma_sequencer_h = dma_environment_h.dma_agent_h.dma_sequencer_h;
    endfunction

    task run_phase(uvm_phase phase);
        write_sequence_h = write_sequence::type_id::create("write_sequence_h");
        read_sequence_h = read_sequence::type_id::create("read_sequence_h");

        phase.raise_objection(this);

        // Write sequence
        write_sequence_h.t_addr = INTR_SFR_ADDR;
        write_sequence_h.t_data = 32'hFFFF_0F0F;
        write_sequence_h.start(dma_sequencer_h);

        write_sequence_h.t_addr = CTRL_SFR_ADDR;
        write_sequence_h.t_data = 32'h1234_5678;
        write_sequence_h.start(dma_sequencer_h);

        write_sequence_h.t_addr = IO_ADDR_SFR_ADDR;
        write_sequence_h.t_data = 32'hABCD_EF12;
        write_sequence_h.start(dma_sequencer_h);

        write_sequence_h.t_addr = MEM_ADDR_SFR_ADDR;
        write_sequence_h.t_data = 32'h9731_2345;
        write_sequence_h.start(dma_sequencer_h);

        // Read sequence
        read_sequence_h.t_addr = INTR_SFR_ADDR;
        read_sequence_h.start(dma_sequencer_h);

        read_sequence_h.t_addr = CTRL_SFR_ADDR;
        read_sequence_h.start(dma_sequencer_h);

        read_sequence_h.t_addr = IO_ADDR_SFR_ADDR;
        read_sequence_h.start(dma_sequencer_h);

        read_sequence_h.t_addr = MEM_ADDR_SFR_ADDR;
        read_sequence_h.start(dma_sequencer_h);
        phase.drop_objection(this);
    endtask
endclass
