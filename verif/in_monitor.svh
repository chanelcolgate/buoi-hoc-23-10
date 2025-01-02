class in_monitor extends uvm_monitor;
    `uvm_component_utils(in_monitor)
    virtual dma_interface vif;

    uvm_analysis_port #(reg_in_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual dma_interface)::get(this, "", "vif", vif))
            `uvm_fatal("IN_MONITOR", "Failed to get VIF")

        ap = new("ap", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        vif.in_monitor_h = this;
    endfunction

    function void write_to_monitor(int addr, int wdata);
        reg_in_item txn;

        txn = reg_in_item::type_id::create("txn");
        txn.val_addr = addr;
        txn.val_data = wdata;
        ap.write(txn);
    endfunction
endclass
