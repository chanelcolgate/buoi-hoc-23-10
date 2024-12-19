package dma_pkg;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    `include "tb_defines.svh"
    `include "dma_seq_item.svh"
    `include "dma_sequencer.svh"

    `include "dma_driver.svh"
    `include "dma_monitor.svh"
    `include "dma_agent.svh"

    `include "dma_coverage.svh"
    // `include "dma_scoreboard.svh"
    `include "dma_environment.svh"

    `include "write_sequence.svh"
    `include "read_sequence.svh"
    `include "dma_test.svh"
endpackage
