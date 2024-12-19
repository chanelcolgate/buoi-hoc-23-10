class dma_coverage extends uvm_subscriber #(dma_seq_item);
  `uvm_component_utils(dma_coverage)

  bit [31:0] addr;
  bit wr_en;
  bit [31:0] wdata;
  bit [31:0] rdata;

  covergroup cov_inst;
    ADDRESS: coverpoint addr {
      option.auto_bin_max = 32;
    } 

    WRITE_ENABLE: coverpoint wr_en {
      option.auto_bin_max = 1;
    }

    WRITE_DATA: coverpoint wdata {
      option.auto_bin_max = 32;
    }

    READ_DATA: coverpoint rdata {
      option.auto_bin_max = 32;
    }
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    cov_inst = new();
  endfunction

  function void write(dma_seq_item t);
    addr = t.addr;
    wr_en = t.wr_en;
    wdata = t.wdata;
    rdata = t.rdata;
    cov_inst.sample();
  endfunction
endclass
