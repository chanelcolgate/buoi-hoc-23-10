package tdpram_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "tdpram_env_config.svh"
    `include "tdpram_agent_config.svh"

    `include "port_A_seq_item.svh"
    `include "tdpram_sequencer.svh"

    `include "tdpram_driver.svh"
    `include "input_monitor.svh"
    `include "output_monitor.svh"
    `include "tdpram_coverage.svh"
    `include "tdpram_scoreboard.svh"
    `include "tdpram_agent.svh"

    `include "tdpram_env.svh"

    `include "tdpram_sequence.svh"
    `include "tdpram_test.svh"
endpackage
