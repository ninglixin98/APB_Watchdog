`ifndef RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV
`define RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV

class rkv_watchdog_base_virtual_sequence extends uvm_sequence;
  
  `uvm_object_utils(rkv_watchdog_base_virtual_sequence)
  `uvm_declare_p_sequencer(rkv_watchdog_virtual_sequencer)

  function new (string name = "rkv_watchdog_base_virtual_sequence");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //to do
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask
  
endclass

`endif//RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV

