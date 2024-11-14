class spi_env extends uvm_env;
    `uvm_component_utils(spi_env)

    spi_agent spi_agent_h;
    spi_scoreboard spi_scoreboard_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void_phase(uvm_phase phase);
        spi_agent_h = spi_agent::type_id::create("spi_agent_h", this);
        spi_scoreboard_h = spi_scoreboard::type_id::create("spi_scoreboard_h", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        spi_agent_h.spi_driver_h.dut_in_pkt.connect(spi_scoreboard_h.drv2sb);
        spi_agent_h.spi_monitor_h.dut_out_pkt.connect(spi_scoreboard_h.mon2sb);
    endfunction
endclass
