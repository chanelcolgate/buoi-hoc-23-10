class spi_driver extends uvm_driver #(spi_seq_item);
    `uvm_component_utils(spi_driver)

    spi_vif m_vif;
    spi_vif s_vif;
    uvm_analysis_port #(spi_seq_item) dut_in_pkt;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual spi_interface)::get(this, "", "m_if", m_vif))
            `uvm_fatal("SPI_DRIVER", {"Virtual interface must be set for:", get_full_name(), ".m_vif"})

        if (!uvm_config_db#(virtual spi_interface)::get(this, "", "s_if", s_vif))
            `uvm_fatal("SPI_DRIVER", {"Virtual interface must be set for:", get_full_name(), ".s_vif"})

        dut_in_pkt = new("dut_in_pkt", this);
    endfunction

    task run_phase(uvm_phase phase);
        spi_seq_item packet;
        spi_seq_item req;

        packet = spi_seq_item::type_id::create("packet");

        wb_bfm::wb_reset(m_vif);
        wb_bfm::wb_reset(s_vif);
        fork
            forever begin
                seq_item_port.get_next_item(req);
                drive_transfer(req);
                $cast(packet, req.clone());
                packet = req;
                // $display($sformatf("exp_master_data: %0h", packet.exp_master_data));
                dut_in_pkt.write(packet);
                seq_item_port.item_done();
                wait (m_vif.tick == 1'b0);
            end
        join_none
    endtask

    task drive_transfer(spi_seq_item seq);
        wb_bfm::wb_write(m_vif, 0, SPI_DIVIDE, seq.divider_reg);
        wb_bfm::wb_write(m_vif, 0, SPI_SS, seq.slave_select_reg); // set ss 0
        wb_bfm::wb_write(m_vif, 0, SPI_TX_0, seq.in_master_data);
        wb_bfm::wb_write(m_vif, 0, SPI_CTRL, seq.master_ctrl_reg);
        wb_bfm::wb_write(s_vif, 0, SPI_CTRL, seq.slave_ctrl_reg);
        wb_bfm::wb_write(s_vif, 0, SPI_TX_0, seq.in_slave_data);
        wb_bfm::wb_write(m_vif, 0, SPI_CTRL, seq.start_dut_reg);
    endtask
endclass
