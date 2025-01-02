class dma_driver extends uvm_driver #(reg_in_item);
    `uvm_component_utils(dma_driver)
    virtual dma_interface vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual dma_interface)::get(this, "", "vif", vif))
            `uvm_fatal("DMA_DRIVER", "Faield to get VIF")
    endfunction

    task run_phase(uvm_phase phase);
        reg_in_item req;
        int rd_data;

        vif.reset_dma();
        forever begin
            seq_item_port.get_next_item(req);
            vif.drive(req.val_addr, req.val_data, rd_data);
            seq_item_port.item_done();
        end
    endtask
endclass
