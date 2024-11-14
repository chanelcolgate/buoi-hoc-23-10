class spi_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(spi_scoreboard)

    // Define analysis_imp port:
    `uvm_analysis_imp_decl(_exp_pkt)
    `uvm_analysis_imp_decl(_act_pkt)

    // Declare analysis_imp port:
    uvm_analysis_imp_exp_pkt#(spi_seq_item, spi_scoreboard) drv2sb;
    uvm_analysis_imp_act_pkt#(spi_seq_item, spi_scoreboard) mon2sb;

    spi_seq_item drv_pkt[$]; // unbounded
    spi_seq_item mon_pkt[$]; // unbounded
    spi_seq_item ip_pkt;
    spi_seq_item op_pkt;

    static string report_tag;
    spi_coverage spi_coverage_h;
    int pass = 0;
    int fail = 0;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        report_tag = $sformatf("%0s", name);
    endfunction

    function void build_phase(uvm_phase);
        spi_coverage_h = spi_coverage::type_id::create("spi_coverage_h", this);

        drv2sb = new("drv2sb", this);
        mon2sb = new("mon2sb", this);
    endfunction

    function void write_exp_pkt(spi_seq_item tmp_pkt);
        spi_seq_item pkt;
        $cast(pkt, tmp_pkt.clone());
        drv_pkt.push_back(pkt);
        uvm_test_done.raise_objection(this);
    endfunction

    function void write_act_pkt(spi_seq_item tmp_pkt);
        spi_seq_item pkt;
        $cast(pkt, tmp_pkt.clone());
        mon_pkt.push_back(pkt);
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            wait (mon_pkt.size() != 0);
            op_pkt = mon_pkt.pop_front();
            ip_pkt = drv_pkt.pop_front();
            perform_check(ip_pkt, op_pkt);
            perform_coverage(ip_pkt);
            uvm_test_done.drop_objection(this);
        end
    endtask

    function void perform_coverage(spi_seq_item pkt);
        spi_coverage_h.perform_coverage(pkt);
    endfunction

    function void perform_check(spi_seq_item ip_pkt, spi_seq_item op_pkt);
        if (ip_pkt.exp_master_data == op_pkt.out_master_data && ip_pkt.exp_slave_data == op_pkt.out_slave_data) begin
            `uvm_info(get_full_name(), "Master PASSED", UVM_MEDIUM)
            `uvm_ifno(get_full_name(), "Slave PASSED", UVM_MEDIUM)
            pass++;
        end else begin
            `uvm_error(
                get_full_name(),
                $sformatf("Slave FAILED: exp data=%0h and out data%0h", ip_pkt.exp_slave_data, op_pkt.out_slave_data)
            )
            `uvm_error(
                get_full_name(),
                $sformatf("Master FAILED: exp data=%0h and out data%0h", ip_pkt.exp_master_data, op_pkt.out_master_data)
            )
            fail++;
        end
    endfunction

    function void extract_phase(uvm_phase phase);
    endfunction

    function void report_phase(uvm_phase phase);
        if (fail==0) begin
            $display("32 bit -- MSB First - TX: posedge --RX: negedge");
            $display("TEST PASSED");
            $display("******************************");
            uvm_report_info(
                "Scoreboard Report",
                $sformatf("Transactions PASS = %0d FAILD = %0d", pass, fail),
                UVM_MEDIUM
            );
            $display("******************************");
            $display("==============================");
            $display("==============================");
        end else begin
            $display("32 bit -- MSB First - TX: posedge --RX: negedge");
            $display("TEST FAILED");
            $display("******************************");
            uvm_report_info(
                "Scoreboard Report",
                $sformatf("Transactions PASS = %0d FAILD = %0d", pass, fail),
                UVM_MEDIUM
            );
            $display("******************************");
            $display("==============================");
            $display("==============================");
        end
    endfunction
endclass
