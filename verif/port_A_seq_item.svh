class port_A_seq_item extends uvm_sequence_item;
    `uvm_object_utils(port_A_seq_item)

    rand byte unsigned din_a;
    rand bit [5:0] addr_a;
    byte unsigned dout_a;

    function new(string name="port_A_seq_item");
        super.new(name);
    endfunction

    function void do_copy(uvm_object rhs);
        port_A_seq_item RHS;

        if (rhs == null)
            `uvm_fatal("PORT_A_SEQ_ITEM", "Tried to copy from a null pointer")

        super.do_copy(rhs);

        if (!$cast(RHS, rhs))
            `uvm_fatal("PORT_A_SEQ_ITEM", "Tried to copy a wrong type")

        RHS.din_a = din_a;
        RHS.addr_a = addr_a;
        RHS.dout_a = dout_a;
    endfunction

    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        port_A_seq_item RHS;
        bit same;

        if (rhs == null)
            `uvm_fatal("PORT_A_SEQ_ITEM", "Tried to do comparision to a null pointer")

        if (!$cast(RHS, rhs))
            same = 0;
        else
            same = super.do_compare(rhs, comparer) &&
                    (RHS.din_a == dout_a);
        return same;
    endfunction

    function string convert2string();
        string s;
        if (din_a)
            s = $sformatf("Data in port A: %2h", din_a);
        else
            s = $sformatf("Data out port A: %2h", dout_a);
        return s;
    endfunction
endclass
