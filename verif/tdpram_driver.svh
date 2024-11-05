class tdpram_driver extends uvm_driver #(port_A_seq_item);
    `uvm_component_utils(tdpram_driver)
    
    virtual tdpram_interface vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        tdpram_agent_config tdpram_agent_config_h;
        if (!uvm_config_db#(tdpram_agent_config)::get(this, "", "config", tdpram_agent_config_h))
            `uvm_fatal("DRIVER", "Failed to get config AGENT")

        vif = tdpram_agent_config_h.vif;
    endfunction

    task run_phase(uvm_phase phase);
        port_A_seq_item req;

        vif.reset_tdpram();
        forever begin
            seq_item_port.get_next_item(req);
            vif.write_and_read_port_A(
                .addr_a_i(req.addr_a),
                .din_a_i(req.din_a)
            );
            seq_item_port.item_done();
        end
    endtask
endclass
