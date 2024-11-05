class tdpram_coverage extends uvm_subscriber #(port_A_seq_item);
    `uvm_component_utils(tdpram_coverage)

    bit [5:0] addr_a;
    byte unsigned din_a;

    covergroup cov_inst;
        ADDR: coverpoint addr_a {
            option.auto_bin_max = 6;
        }

        INPUT_DATA: coverpoint din_a {
            option.auto_bin_max = 8;
        }
    endgroup

    function new(string name, uvm_component parent);
        super.new(name, parent);
        cov_inst = new();
    endfunction

    function void write(port_A_seq_item t);
        addr_a = t.addr_a;
        din_a = t.din_a;
        cov_inst.sample();
    endfunction
endclass
