class sfifo_driver extends uvm_driver #(sfifo_seq_item);
  `uvm_component_utils(sfifo_driver)

  virtual sfifo_interface vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual sfifo_interface)::get(this, "", "vif", vif))
      `uvm_fatal("SFIFO_DIRVER", "Failed to get VIF")
  endfunction

  task run_phase(uvm_phase phase);
    sfifo_seq_item req;

    vif.reset_sfifo();
    forever begin
      seq_item_port.get_next_item(req);
      vif.send_req(req.wr_en, req.rd_en, req.input_data);
      seq_item_port.item_done();
    end
  endtask
endclass
