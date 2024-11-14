class spi_coverage extends uvm_component;
    `uvm_component_utils(spi_coverage)

    spi_seq_item c_pkt;

    covergroup cov_inst;
        cp_dut_mosi: coverpoint c_pkt.exp_master_data {
            bins byte0_7 = {[0:255]};
            bins byte8_15 = {[256:65535]};
            bins byte16_23 = {[65536:16777215]};
            bins byte24_31 = {[16777216:$]};
        }
    endgroup

    function new(string name, uvm_component parent);
        super.new(name, parent);
        cov_inst = new();
    endfunction

    function void perform_coverage(spi_seq_item pkt);
        this.c_pkt = pkt;
        cov_inst.sample();
    endfunction
endclass
