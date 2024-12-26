class uart_out_monitor extends uvm_monitor;
    `uvm_component_utils(uart_out_monitor)

    virtual uart_interface vif;
    uvm_analysis_port #(uart_out_seq_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual uart_interface)::get(this, "", "vif", vif))
            `uvm_fatal("UART_OUT_MONITOR", "Failed to get VIF")

        ap = new("ap", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        vif.uart_out_monitor_h = this;
    endfunction

    function void write_to_monitor(
        bit uart_tx_dout
    );
        uart_out_seq_item uart_out_monitor_struct;
        uart_out_monitor_struct = uart_out_seq_item::type_id::create("uart_out_monitor_struct");

        uart_out_monitor_struct.uart_tx_dout = uart_tx_dout;

        ap.write(uart_out_monitor_struct);
    endfunction
endclass
