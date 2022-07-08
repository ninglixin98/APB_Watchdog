`ifndef RKV_WATCHDOG_INTEGRATION_VIRT_SEQ_SV
`define RKV_WATCHDOG_INTEGRATION_VIRT_SEQ_SV

class rkv_watchdog_integration_virt_seq extends rkv_watchdog_base_virtual_sequence;
  
  `uvm_object_utils(rkv_watchdog_integration_virt_seq)
  
  function new (string name = "rkv_watchdog_integration_virt_seq");
    super.new(name);
  endfunction

  task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //to do
    #1us;
    `uvm_info("body", "Body started...", UVM_LOW)
    #1us;
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask


endclass

`endif//RKV_WATCHDOG_INTEGRATION_VIRT_SEQ_SV

