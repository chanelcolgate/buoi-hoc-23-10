class uart_driver extends uvm_driver #(uart_in_seq_item);
    `uvm_component_utils(uart_driver)

    virtual uart_interface vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual uart_interface)::get(this, "", "vif", vif))
            `uvm_fatal("UART_DRIVER", "Failed to get VIF")
    endfunction

    task run_phase(uvm_phase phase);
        uart_in_seq_item uart_in_struct;

        seq_item_port.get_next_item(uart_in_struct);
        vif.initiate_and_get_response(
            uart_in_struct.tx_buffer_addr,
            uart_in_struct.tx_buffer_en_rd,
            uart_in_struct.tx_buffer_en_wr,
            uart_in_struct.tx_num,
            uart_in_struct.tx_buffer_data
        );
        seq_item_port.item_done();
    endtask
endclass
