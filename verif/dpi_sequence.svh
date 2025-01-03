class dpi_sequence extends uvm_sequence;
    `uvm_object_utils(dpi_sequence)

    function new(string name="dpi_sequence");
        super.new(name);
    endfunction

    task body();
        `uvm_info(
            get_type_name(),
            {
                "\n------------------------",
                get_type_name(),
                " started !!! -------------"
            },
            UVM_LOW
        )
        DPI_seq_start(get_sequencer(), this);
    endtask
endclass
