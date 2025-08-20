class driver extends uvm_driver#(seq_item);
  `uvm_component_utils(driver)
  //register the callback in component
  `uvm_register_cb(driver,driver_cb)
  
  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task run_phase (uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      //callback hook --
      `uvm_do_callbacks(driver,driver_cb,modify_pkt(req));

      `uvm_info(get_full_name(),$sformatf("Driving good pkt : addr =%0d  data=%0d", req.addr,req.data),UVM_LOW)
      #20; 
      seq_item_port.item_done();
    end
  endtask
endclass
