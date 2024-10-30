package sfifo_pkg;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    `include "sfifo_seq_item.svh"
    `include "sfifo_sequencer.svh"

    `include "sfifo_driver.svh"
    `include "sfifo_monitor.svh"
    `include "sfifo_agent.svh"

    `include "sfifo_coverage.svh"
    `include "sfifo_scoreboard.svh"
    `include "sfifo_environment.svh"

    `include "sfifo_sequence.svh"
    `include "sfifo_test.svh"
endpackage