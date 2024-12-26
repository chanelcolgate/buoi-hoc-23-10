package uart_pkg;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    `include "uart_in_seq_item.svh"
    `include "uart_out_seq_item.svh"
    `include "uart_sequencer.svh"

    `include "uart_driver.svh"
    `include "uart_in_monitor.svh"
    `include "uart_out_monitor.svh"
    `include "uart_agent.svh"

    `include "uart_environment.svh"

    `include "uart_sequence.svh"
    `include "uart_test.svh"
endpackage
