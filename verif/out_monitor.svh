class out_monitor extends uvm_monitor;
    `uvm_component_utils(out_monitor)
    virtual dma_interface vif;

    uvm_analysis_port #(reg_out_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phaes phase);
        if (!uvm_config_db#(virtual dma_interface)::get(this, "", "vif", vif))
            `uvm_fatal("OUT_MONITOR", "Failed to get VIF")

        ap = new("ap", this);
    endfunction

    function void connect_phase(uvm_phae phase);
        vif.out_monitor_h = this;
    endfunction

    function void write_to_monitor(int rdata);
        reg_out_item txn;

        txn = reg_out_item::type_id::create("txn");
        txn.rd_data = rdata;
        ap.write(txn);
    endfunction
endclass
