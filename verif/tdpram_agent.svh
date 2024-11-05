class tdpram_agent extends uvm_agent;
    `uvm_component_utils(tdpram_agent)

    tdpram_agent_config tdpram_agent_config_h;

    tdpram_driver tdpram_driver_h;
    tdpram_sequencer tdpram_sequencer_h;
    input_monitor input_monitor_h;
    output_monitor output_monitor_h;

    tdpram_coverage tdpram_coverage_h;
    tdpram_scoreboard tdpram_scoreboard_h;

    // uvm_analysis_port #(port_A_seq_item) input_ap;
    // uvm_analysis_port #(port_A_seq_item) output_ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(tdpram_agent_config)::get(this, "", "config", tdpram_agent_config_h))
            `uvm_fatal("TDPRAM_AGENT", "Failed to get config AGENT")

        is_active = tdpram_agent_config_h.get_is_active();

        if (get_is_active() == UVM_ACTIVE) begin
            tdpram_sequencer_h = tdpram_sequencer::type_id::create("tdpram_sequencer_h", this);
            tdpram_driver_h = tdpram_driver::type_id::create("tdpram_driver_h", this);
        end

        input_monitor_h = input_monitor::type_id::create("input_monitor_h", this);
        output_monitor_h = output_monitor::type_id::create("output_monitor_h", this);
        tdpram_coverage_h = tdpram_coverage::type_id::create("tdpram_coverage_h", this);
        tdpram_scoreboard_h = tdpram_scoreboard::type_id::create("tdpram_scoreboard_h", this);

        // input_ap = new("input_ap", this);
        // output_ap = new("output_ap", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            tdpram_driver_h.seq_item_port.connect(tdpram_sequencer_h.seq_item_export);
        end

        // input_monitor_h.input_port.connect(input_ap);
        // output_monitor_h.output_port.connect(output_ap);

        input_monitor_h.input_port.connect(tdpram_coverage_h.analysis_export);
        input_monitor_h.input_port.connect(tdpram_scoreboard_h.input_f.analysis_export);
        output_monitor_h.output_port.connect(tdpram_scoreboard_h.analysis_export);
    endfunction
endclass
