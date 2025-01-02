class dma_scoreboard extends uvm_subscriber #(reg_out_item);
    `uvm_component_utils(dma_scoreboard)

    uvm_tlm_analysis_fifo #(reg_in_item) input_port;

    int m_matches, m_mismatches, m_unexpected;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        input_port = new("input_port", this);

        m_matches = 0;
        m_mismatches = 0;
        m_unexpected = 0;
    endfunction

    function void write(reg_out_item t);
        reg_in_item input_t;
        reg_out_item predicted;
        string data_str;

        if (t.rd_data) begin
            if (!input_port.try_get(input_t))
                `uvm_fatal("DMA_SCOREBOARD", "Missing input_t in self checker")

            predicted.rd_data = input_t.val_data;

            data_str = {
               input_t.convert2string(),
               " ==> Actual ", t.convert2string(), 
               "/Predicted ", predicted.convert2string()
            };
            if (!predicted.compare(t))
                `uvm_error("SELF CHECKER", {"FAIL: ", data_str})
            else
                `uvm_info("SELF CHECKER", {"PASS: ", data_str}, UVM_MEDIUM)
        end
    endfunction
endclass
