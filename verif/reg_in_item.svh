class reg_in_item extends uvm_sequence_item;
    `uvm_object_utils(reg_in_item)

    typedef enum {READ, WRITE} kind_t;
    rand kind_t kind = WRITE;
    rand int val_addr, val_data;

    function new(string name="reg_in_item");
        super.new(name);
    endfunction

    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        reg_in_item RHS;
        bit same;

        if (rhs == null)
            `uvm_fatal("REG_IN_ITEM", "Tried to do comparision to a null pointer")

        if (!$cast(RHS, rhs))
            same = 0;
        else
            same = super.do_compare(rhs, comparer) &&
                    (RHS.val_addr == val_addr) &&
                    (RHS.val_data == val_data);
        return same;
    endfunction

    function convert2string();
        string msg;
        msg = {
            msg,
                    "\n ---------------\n",
            $sformatf(" Val_Addr: %d\n", val_addr),
            $sformatf(" Val_Data: %d\n", val_data),
                      " ---------------"
        };
        return msg;
    endfunction
endclass
