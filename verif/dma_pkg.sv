package dma_pkg;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    `include "reg_in_item.svh"
    `include "reg_out_item.svh"
    `include "dma_sequencer.svh"

    `include "dma_driver.svh"
    `include "in_monitor.svh"
    `include "out_monitor.svh"
    `include "dma_agent.svh"

    `include "dma_coverage.svh"
    `include "dma_scoreboard.svh"
    `include "dma_environment.svh"

    `include "dma_sequence.svh"
    `include "dma_test.svh"
endpackage
