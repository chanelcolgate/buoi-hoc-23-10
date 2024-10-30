class sfifo_seq_item extends uvm_sequence_item;
  `uvm_object_utils(sfifo_seq_item)

  rand bit wr_en;
  rand bit rd_en;
  rand byte unsigned input_data;
  byte unsigned output_data;
  bit full;
  bit empty;

  constraint wr_rd {wr_en != rd_en;}

  function new(string name = "sfifo_seq_item");
    super.new(name);
  endfunction

  // function void do_copy(uvm_object rhs);
  //   sfifo_seq_item RHS;

  //   if (rhs == null)
  //     `uvm_fatal("SFIFO_SEQ_ITEM", "Tried to copy from a null pointer")

  //   super.do_copy(rhs);

  //   if (!$cast(RHS, rhs))
  //     `uvm_fatal("SFIFO_SEQ_ITEM", "Tried to copy wrong type")

  //   wr_en = RHS.wr_en;
  //   rd_en = RHS.rd_en;
  //   input_data = RHS.input_data;
  //   output_data = RHS.output_data;
  //   full = RHS.full;
  //   empty = RHS.empty;
  // endfunction

  // function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  //   sfifo_seq_item RHS;
  //   bit same;

  //   if (rhs == null)
  //     `uvm_fatal("SFIFO_SEQ_ITEM", "Tried to do comparision to a null pointer")

  //   if (!$cast(RHS, rhs))
  //     same = 0;
  //   else
  //     same = super.do_compare(rhs, comparer) &&
  //             (RHS.wr_en == wr_en) &&
  //             (RHS.rd_en == rd_en) &&
  //             (RHS.input_data == input_data) &&
  //             (RHS.output_data == output_data) &&
  //             (RHS.full == full) &&
  //             (RHS.empty == empty);

  //   return same;
  // endfunction

  function string convert2string();
    string s;
    if (input_data)
      s = $sformatf("input_data: %2h", input_data);
    else
      s = $sformatf("output_data: %2h", output_data);
    return s;
  endfunction
endclass
