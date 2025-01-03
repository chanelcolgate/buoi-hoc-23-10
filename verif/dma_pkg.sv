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

    `include "test_base.svh"
    `include "api_write_sequence.svh"

    // DPI
    // For C_Program
    import "DPI-C" context task C_Program();
    export "DPI-C" sv_write = task write;
    // export "DPI-C" sv_read = task read;

    uvm_sequencer_base m_sqr;
    uvm_sequence m_seq;

    task automatic DPI_seq_start(
        input uvm_sequencer_base sqr_,
        input uvm_sequence seq_
    );
        if ((m_sqr != null) || (m_seq != null))
            `uvm_fatal("DMA_AGENT_PKG", "C_Program by another sequence is still running.")

        m_sqr = sqr_;
        m_seq = seq_;
        C_Program();
        m_sqr = null;
        m_seq = null;
    endtask

    task automatic write(input int A, D);
        api_write_sequence api_wr_seq;
        api_wr_seq = api_write_sequence::type_id::create("api_wr_seq");
        api_wr_seq.val_addr = A;
        api_wr_seq.val_data = D;
        api_wr_seq.start(m_sqr, m_seq);
    endtask

    `include "dpi_sequence.svh"
    `include "dpi_test.svh"
endpackage
