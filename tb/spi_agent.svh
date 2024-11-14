class spi_agent extends uvm_agent;
    `uvm_component_utils(spi_agent)

    spi_sequencer spi_sequencer_h;
    spi_driver spi_driver_h;
    spi_monitor spi_monitor_h;


    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        spi_vif m_vif;
        spi_vif s_vif;

        if (!uvm_config_db#(virtual spi_interface)::get(this, "", "m_if", m_vif))
            `uvm_fatal("SPI_AGENT", {"Virtual interface must be set for:", get_full_name(), ".m_vif"})

        if (!uvm_config_db#(virtual spi_interface)::get(this, "", "s_if", s_vif))
            `uvm_fatal("SPI_AGENT", {"Virtual interface must be set for:", get_full_name(), ".s_vif"})
        
        spi_sequencer_h = spi_sequencer::type_id::create("spi_sequencer_h", this);
        spi_driver_h = spi_driver::type_id::create("spi_driver_h", this);
        spi_monitor_h = spi_monitor::type_id::create("spi_monitor_h", this);

        spi_driver_h.m_vif = m_vif;
        spi_driver_h.s_vif = s_vif;

        spi_monitor_h.m_vif = m_vif;
        spi_monitor_h.s_vif = s_vif;
    endfunction

    function void connect_phase(uvm_phase phase);
        spi_driver_h.seq_item_port.connect(spi_sequencer_h.seq_item_export);
    endfunction
endclass
