class sfifo_scoreboard extends uvm_subscriber #(sfifo_seq_item);
  `uvm_component_utils(sfifo_scoreboard)

  uvm_tlm_analysis_fifo #(sfifo_seq_item) input_port;
  int queue[$];

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    input_port = new("input_port", this);
  endfunction

  // function void write(sfifo_seq_item t);
  //   sfifo_seq_item input_t;
  //   byte unsigned predicted;


  //   if (t.input_data) begin
  //     queue.push_back(t.input_data);
  //     // `uvm_info("SFIFO_SCOREBOARD", t.convert2string(), UVM_LOW)
  //   end else begin
  //     if (queue.size() >= 'd1) begin
  //       predicted = queue.pop_front();

  //       if (!input_port.try_get(input_t))
  //         `uvm_error("SFIFO_SCOREBOARD", "Missing input_data in self checker")

  //       if (predicted == input_t.input_data) begin
  //         `uvm_info(
  //           "SELF_CHECKER",
  //           {$sformatf("PASS: input_data: %2h| ", predicted), input_t.convert2string()},
  //           UVM_LOW
  //         )
  //       end else begin
  //         `uvm_error(
  //           "SELF_CHECKER",
  //           {$sformatf("FAIL: input_data: %2h| ", predicted), input_t.convert2string()}
  //         )
  //       end
  //     end
  //   end
  // endfunction

  function void write(sfifo_seq_item t);

    sfifo_seq_item input_t;
    byte unsigned predicted;


    if (t.output_data) begin
      if (!input_port.try_get(input_t))
        `uvm_error("SFIFO_SCOREBOARD", "Missing input_data in self checker")

      queue.push_back(input_t.input_data);
      // `uvm_info("SFIFO_SCOREBOARD", t.convert2string(), UVM_LOW)
      if (queue.size() >= 'd1) begin
        predicted = queue.pop_front();

        if (predicted == t.output_data) begin
          `uvm_info(
            "SELF_CHECKER",
            {$sformatf("PASS: input_data: %2h| ", predicted), t.convert2string()},
            UVM_LOW
          )
        end else begin
          `uvm_error(
            "SELF_CHECKER",
            {$sformatf("FAIL: input_data: %2h| ", predicted), t.convert2string()}
          )
        end
      end
    end
  endfunction
endclass
