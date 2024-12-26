class uart_in_monitor extends uvm_monitor;
    `uvm_component_utils(uart_in_monitor)

    virtual uart_interface vif;
    uvm_analysis_port #(uart_in_seq_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual uart_interface)::get(this, "", "vif", vif))
            `uvm_fatal("UART_IN_MONITOR", "Failed to get VIF")

        ap = new("ap", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        vif.uart_in_monitor_h = this;
    endfunction

    function void write_to_monitor(
        bit [7:0] tx_buffer_addr,
        bit tx_buffer_en_rd,
        bit tx_buffer_en_wr,
        bit [7:0] tx_num,
        bit [31:0] tx_buffer_data
    );
        uart_in_seq_item uart_in_monitor_struct;

        uart_in_monitor_struct = uart_in_seq_item::type_id::create("uart_in_monitor_struct");

        uart_in_monitor_struct.tx_buffer_addr = tx_buffer_addr;
        uart_in_monitor_struct.tx_buffer_en_rd = tx_buffer_en_rd;
        uart_in_monitor_struct.tx_buffer_en_wr = tx_buffer_en_wr;
        uart_in_monitor_struct.tx_num = tx_num;
        uart_in_monitor_struct.tx_buffer_data = tx_buffer_data;

        ap.write(uart_in_monitor_struct);
    endfunction
endclass
