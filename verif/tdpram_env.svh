class tdpram_env extends uvm_env;
    `uvm_component_utils(tdpram_env)

    tdpram_agent class_tdpram_agent_h;
    tdpram_agent module_tdpram_agent_h;

    tdpram_agent_config class_config_h;
    tdpram_agent_config module_config_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        virtual tdpram_interface class_vif;
        virtual tdpram_interface module_vif;
        tdpram_env_config tdpram_env_config_h;

        if (!uvm_config_db#(tdpram_env_config)::get(this, "", "config", tdpram_env_config_h))
            `uvm_fatal("TDPRAM_ENV", "Failed to get config ENV")

        class_config_h = new(.vif(tdpram_env_config_h.class_vif), .is_active(UVM_ACTIVE));
        module_config_h = new(.vif(tdpram_env_config_h.module_vif), .is_active(UVM_PASSIVE));

        uvm_config_db#(tdpram_agent_config)::set(this, "class_tdpram_agent_h*", "config", class_config_h);
        uvm_config_db#(tdpram_agent_config)::set(this, "module_tdpram_agent_h*", "config", module_config_h);

        class_tdpram_agent_h = new("class_tdpram_agent_h", this);
        module_tdpram_agent_h = new("module_tdpram_agent_h", this);
    endfunction
endclass
