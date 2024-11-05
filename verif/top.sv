module top;
    `include "uvm_macros.svh"

    import uvm_pkg::*;

    tdpram_interface class_tif();

    tdp_ram class_dut (
        .clk(class_tif.clk),
        .sclr(class_tif.sclr),
        .din_a(class_tif.din_a),
        .din_b(class_tif.din_b),
        .addr_a(class_tif.addr_a),
        .addr_b(class_tif.addr_b),
        .we_a(class_tif.we_a),
        .we_b(class_tif.we_b),
        .dout_a(class_tif.dout_a),
        .dout_b(class_tif.dout_b)
    );

    tdpram_interface module_tif();

    tdp_ram module_dut (
        .clk(module_tif.clk),
        .sclr(module_tif.sclr),
        .din_a(module_tif.din_a),
        .din_b(module_tif.din_b),
        .addr_a(module_tif.addr_a),
        .addr_b(module_tif.addr_b),
        .we_a(module_tif.we_a),
        .we_b(module_tif.we_b),
        .dout_a(module_tif.dout_a),
        .dout_b(module_tif.dout_b)
    );

    tdpram_tester_module stim_module (module_tif);

    initial begin
        uvm_config_db #(virtual tdpram_interface)::set(null, "*", "class_tif", class_tif);
        uvm_config_db #(virtual tdpram_interface)::set(null, "*", "module_tif", module_tif);
        run_test("tdpram_test");
    end
endmodule
