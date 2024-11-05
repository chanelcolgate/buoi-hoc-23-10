class tdpram_agent_config;
    virtual tdpram_interface vif;
    protected uvm_active_passive_enum is_active;

    function new(virtual tdpram_interface vif, uvm_active_passive_enum is_active);
        this.vif = vif;
        this.is_active = is_active;
    endfunction

    function uvm_active_passive_enum get_is_active();
        return is_active;
    endfunction
endclass
