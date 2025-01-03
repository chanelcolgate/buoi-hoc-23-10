class dpi_test extends test_base;
    `uvm_component_utils(dpi_test)

    dpi_sequence dpi_sequence_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        dpi_sequence_h = dpi_sequence::type_id::create("dpi_sequence_h");

        phase.raise_objection(this);
        dpi_sequence_h.start(dma_sequencer_h);
        phase.drop_objection(this);
    endtask
endclass
