class input_monitor extends uvm_monitor;
    `uvm_component_utils(input_monitor)

    virtual tdpram_interface vif;
    uvm_analysis_port #(port_A_seq_item) input_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        tdpram_agent_config tdpram_agent_config_h;
        if (!uvm_config_db#(tdpram_agent_config)::get(this, "", "config", tdpram_agent_config_h))
            `uvm_fatal("INPUT_MONITOR", "Failed to get config AGENT")

        tdpram_agent_config_h.vif.input_monitor_h = this;

        input_port = new("input_port", this);
    endfunction

    function void write_to_monitor(
        bit [5:0] addr_a,
        byte unsigned din_a
    );
        port_A_seq_item input_t;

        input_t = port_A_seq_item::type_id::create("input_t");

        input_t.addr_a = addr_a;
        input_t.din_a = din_a;
        input_port.write(input_t);
    endfunction
endclass
