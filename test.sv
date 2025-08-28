class base_test extends uvm_test;
  env env_o;
  base_seq bseq;

  `uvm_component_utils(base_test)
  
  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"build phase",UVM_LOW)
    env_o = env::type_id::create("env_o", this);
  endfunction
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    bseq = base_seq::type_id::create("bseq");
    bseq.start(env_o.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass
 
class err_test extends base_test;
  //callback handle
  derived_drv_cb drvd_dr;
  `uvm_component_utils(err_test)
  
  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drvd_dr = derived_drv_cb::type_id::create("drvd_dr", this);
  endfunction
  
  function void end_of_elaboration();
    super.end_of_elaboration();
    //add method 
    uvm_callbacks#(driver, driver_cb)::add(env_o.agt.drv,drvd_dr);
  endfunction 
  
endclass
