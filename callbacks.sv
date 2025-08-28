class driver_cb extends uvm_callback;
  `uvm_object_utils(driver_cb)
  
  function new(string name = "");
    super.new(name);
  endfunction
   
  virtual task modify_pkt(ref seq_item req);
  endtask
endclass

class derived_drv_cb extends driver_cb;
  `uvm_object_utils(derived_drv_cb)
  
  function new(string name = "");
    super.new(name);
  endfunction
  
  task modify_pkt(ref seq_item req); // callback method implementation
    `uvm_info(get_type_name()," Injecting errors",UVM_LOW)
    req.pkt = BAD_ERR1;
    req.addr = 16'hFFFF;
    req.print();
  endtask
endclass

