`ifndef RKV_WATCHDOG_REG_ENABLE_RESET_SV
`define RKV_WATCHDOG_REG_ENABLE_RESET_SV

class rkv_watchdog_reg_enable_reset extends rkv_watchdog_base_element_sequence;
  `uvm_object_utils(rkv_watchdog_reg_enable_reset)

  function new (string name = "rkv_watchdog_reg_enable_reset");
    super.new(name);
  endfunction

  task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //enable reset    
    rgm.WDOGCONTROL.RESEN.set(1'b1);
    rgm.WDOGCONTROL.update(status);
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass


`endif//RKV_WATCHDOG_REG_ENABLE_RESET_SV

