interface uart_interface(input logic clk);
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    bit rst;
    bit [7:0] tx_num_o; // It stores the number of bytes to be sent
    bit start_tx_o;     // It goes high for one clock cycle to indicate
                      // that a transmission has started

    bit tx_en_i;        // It is equal to 1 when UART is transmitting
    bit tx_busy_flag_i; // It remains at 1 when a transmission is in progress

    bit [7:0] tx_buffer_addr_o;
    bit [31:0] tx_buffer_data_o;
    bit [3:0] tx_buffer_en_rd_o;
    bit [3:0] tx_buffer_en_wr_o;

    bit [7:0] uart_tx_ctrl_reg_o;
    bit ext_sync_start_o;

    bit [31:0] tx_buffer_data_read_i;
    bit [7:0] tx_byte_out_i;
    bit tx_data_i;

    bit tx_data_we_i;
    bit [31:0] uart_tx_dout_i;

    task initiate_and_get_response(
        input bit [7:0] tx_buffer_addr,
        input bit tx_buffer_en_rd,
        input bit tx_buffer_en_wr,
        input bit [7:0] tx_num,
        input bit [31:0] tx_buffer_data
    );
        // ext_sync_start_o = ext_sync_start_i;
        // uart_tx_ctrl_reg_o = uart_config;
        while (tx_en_i == 1'b1)
            @(posedge clk);
            start_tx_o = 1'b1;
            tx_buffer_addr_o = tx_buffer_addr;
            tx_buffer_en_rd_o = tx_buffer_en_rd;
            tx_buffer_en_wr_o = tx_buffer_en_wr;
            tx_num_o = tx_num;
            tx_buffer_data_o = tx_buffer_data;
            @(posedge clk);
            start_tx_o = 1'b0;
            repeat (2) begin
                @(posedge clk);
            end

            // responder_struct = UART_in_responder_struct;
    endtask

    uart_in_monitor uart_in_monitor_h;
    always @(posedge clk) begin
        if (start_tx_o == 1'b0) begin
            uart_in_monitor_h.write_to_monitor(
                .tx_buffer_addr(tx_buffer_addr_o),
                .tx_buffer_en_rd(tx_buffer_en_rd_o),
                .tx_buffer_en_wr(tx_buffer_en_wr_o),
                .tx_num(tx_num_o),
                .tx_buffer_data(tx_buffer_data_o)
            );
        end
    end

    uart_out_monitor uart_out_monitor_h;
    bit flag_first_transmission;
    bit flag_last_byte;
    bit [7:0] bit_transmission_cc;
    bit [7:0] n_bits;
    bit [7:0] data_frame_length;

    initial begin
        forever begin
            if (tx_busy_flag_i == 1'b0) begin
                flag_first_transmission = 1'b1;
            end

            if (flag_last_byte == 1'b0) begin
                while (tx_busy_flag_i == 1'b0)
                    @(posedge clk);
                    if (flag_first_transmission == 1'b1) begin
                        repeat (3) @(posedge clk);
                        uart_out_monitor_h.write_to_monitor(
                            uart_tx_dout_i
                        );
                        repeat (bit_transmission_cc-1) @(posedge clk);
                        flag_first_transmission = 1'b0;
                    end else begin
                        uart_out_monitor_h.write_to_monitor(
                            uart_tx_dout_i
                        );
                        repeat (bit_transmission_cc-1) @(posedge clk);
                    end
                    if (tx_busy_flag_i == 1'b0) begin
                        flag_last_byte = 1'b1;
                        n_bits = 0;
                    end
            end else begin
                // data_frame_length = start + data + parity + stop;
                if (n_bits < data_frame_length - 1) begin
                    uart_out_monitor_h.write_to_monitor(uart_tx_dout_i);
                    repeat (bit_transmission_cc-1) @(posedge clk);
                    n_bits = n_bits + 1;
                    if (n_bits == data_frame_length - 1) begin
                        flag_last_byte = 1'b0;
                        n_bits = 0;
                    end
                end
            end
        end
    end
endinterface
