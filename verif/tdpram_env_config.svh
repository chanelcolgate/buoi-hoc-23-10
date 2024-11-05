class tdpram_env_config;
    virtual tdpram_interface class_vif;
    virtual tdpram_interface module_vif;

    function new(
        virtual tdpram_interface class_vif,
        virtual tdpram_interface module_vif
    );
        this.class_vif = class_vif;
        this.module_vif = module_vif;
    endfunction
endclass
