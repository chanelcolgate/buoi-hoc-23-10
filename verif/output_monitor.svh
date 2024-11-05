class output_monitor extends uvm_monitor;
    `uvm_component_utils(output_monitor)

    virtual tdpram_interface vif;
    uvm_analysis_port #(port_A_seq_item) output_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        tdpram_agent_config tdpram_agent_config_h;
        if (!uvm_config_db#(tdpram_agent_config)::get(this, "", "config", tdpram_agent_config_h))
            `uvm_fatal("OUTPUT_MONITOR", "Failed to get config AGENT")

        tdpram_agent_config_h.vif.output_monitor_h = this;
        output_port = new("output_port", this);
    endfunction

    function void write_to_monitor(
        bit [5:0] addr_a,
        byte unsigned dout_a
    );
        port_A_seq_item output_t;

        output_t = port_A_seq_item::type_id::create("output_t");

        output_t.addr_a = addr_a;
        output_t.dout_a = dout_a;
        output_port.write(output_t);
    endfunction
endclass
