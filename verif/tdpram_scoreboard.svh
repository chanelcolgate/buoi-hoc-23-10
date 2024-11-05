class tdpram_scoreboard extends uvm_subscriber #(port_A_seq_item);
    `uvm_component_utils(tdpram_scoreboard)

    uvm_tlm_analysis_fifo #(port_A_seq_item) input_f;
    bit [7:0] mem [0:63];

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        input_f = new("input_f", this);
    endfunction

    function void write(port_A_seq_item t);
        port_A_seq_item input_t;

        if (!input_f.try_get(input_t))
            `uvm_fatal("TDPRAM_SCOREBOARD", "Failed to get input port A")

        if (input_t.din_a) begin
            mem[input_t.addr_a] = input_t.din_a;
            // $display("input addr: %d", input_t.addr_a);
        end

        // if (t.addr_a)
        //     $display("output addr: %d", t.addr_a);

        if (t.dout_a == mem[t.addr_a]) begin
            `uvm_info(
                "SELF_CHECKER",
                {
                    $sformatf("PASS: input_data: %2h| ", mem[t.addr_a]),
                    t.convert2string()
                },
                UVM_LOW
            )
        end else begin
            `uvm_error(
                "SELF_CHECKER",
                {
                    $sformatf("FAIL: input_data: %2h| ", mem[t.addr_a]),
                    t.convert2string()
                }
            )
        end 
    endfunction
endclass
