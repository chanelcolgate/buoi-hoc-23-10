class tdpram_test extends uvm_test;
    `uvm_component_utils(tdpram_test)

    tdpram_sequencer tdpram_sequencer_h;
    tdpram_env tdpram_env_h;
    tdpram_sequence tdpram_sequence_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        virtual tdpram_interface class_vif;
        virtual tdpram_interface module_vif;
        tdpram_env_config tdpram_env_config_h;

        if (!uvm_config_db#(virtual tdpram_interface)::get(this, "", "class_tif", class_vif))
            `uvm_fatal("TDPRAM_TEST", "Failed to get config VIF")

        if (!uvm_config_db#(virtual tdpram_interface)::get(this, "", "module_tif", module_vif))
            `uvm_fatal("TDPRAM_TEST", "Failed to get config VIF")

        tdpram_env_config_h = new(
            .class_vif(class_vif),
            .module_vif(module_vif)
        );

        uvm_config_db #(tdpram_env_config)::set(this, "tdpram_env_h*", "config", tdpram_env_config_h);

        tdpram_env_h = tdpram_env::type_id::create("tdpram_env_h", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        tdpram_sequencer_h = tdpram_env_h.class_tdpram_agent_h.tdpram_sequencer_h;
    endfunction

    task run_phase(uvm_phase phase);
        tdpram_sequence_h = tdpram_sequence::type_id::create("tdpram_sequence_h");
        phase.raise_objection(this);
        tdpram_sequence_h.start(tdpram_sequencer_h);
        phase.drop_objection(this);
    endtask
endclass
