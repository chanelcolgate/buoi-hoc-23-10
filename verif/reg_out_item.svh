class reg_out_item extends uvm_sequence_item;
    `uvm_object_utils(reg_out_item)

    rand int rd_data;

    function new(string name="reg_out_item");
        super.new(name);
    endfunction

    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        reg_out_item RHS;
        bit same;

        if (rhs == null)
            `uvm_fatal("REG_OUT_ITEM", "Tried to do comparision to a null pointer")

        if (!$cast(RHS, rhs))
            same = 0;
        else
            same = super.do_compare(rhs, comparer) &&
                    (RHS.rd_data == rd_data);
        return same;
    endfunction

    function string convert2string();
        string msg;
        msg = {
            msg,
                    "\n ---------------\n",
            $sformatf(" Val_Rd_Data: %d\n", rd_data),
                      " ---------------"
        };
        return msg;
    endfunction
endclass
