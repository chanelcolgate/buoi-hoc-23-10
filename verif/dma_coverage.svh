class dma_coverage extends uvm_subscriber #(reg_in_item);
    `uvm_component_utils(dma_coverage)

    int val_addr, val_data;

    covergroup cov_inst;
        ADDR: coverpoint val_addr {option.auto_bin_max = 32;}
        WDATA: coverpoint val_data {option.auto_bin_max = 32;}
    endgroup

    function new(string name, uvm_component parent);
        super.new(name, parent);
        cov_inst = new();
    endfunction

    function void write(reg_in_item t);
        val_addr = t.val_addr;
        val_data = t.val_data;
        cov_inst.sample();
    endfunction
endclass
