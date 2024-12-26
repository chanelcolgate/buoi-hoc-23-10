class uart_environment extends uvm_env;
    `uvm_component_utils(uart_environment)

    uart_agent uart_agent_h;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        uart_agent_h = uart_agent::type_id::create("uart_agent_h", this);
    endfunction
endclass
