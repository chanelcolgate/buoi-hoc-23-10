class sfifo_coverage extends uvm_subscriber #(sfifo_seq_item);
  `uvm_component_utils(sfifo_coverage)

  bit [7:0] input_data;

  covergroup cov_inst;
    INPUT_DATA: coverpoint input_data {
      option.auto_bin_max = 8;
    } 
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    cov_inst = new();
  endfunction

  function void write(sfifo_seq_item t);
    input_data = t.input_data;
    cov_inst.sample();
  endfunction
endclass
