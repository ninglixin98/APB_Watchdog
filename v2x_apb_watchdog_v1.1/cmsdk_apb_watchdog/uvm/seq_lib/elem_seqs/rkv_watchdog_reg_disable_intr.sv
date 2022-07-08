`ifndef RKV_WATCHDOG_REG_DISABLE_INTR_SV
`define RKV_WATCHDOG_REG_DISABLE_INTR_SV

class rkv_watchdog_reg_disable_intr extends rkv_watchdog_base_element_sequence;
  `uvm_object_utils(rkv_watchdog_reg_disable_intr)

  function new (string name = "rkv_watchdog_reg_disable_intr");
    super.new(name);
  endfunction

  task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //disable watchdog and interrupt    
    rgm.WDOGCONTROL.INTEN.set(1'b0);
    rgm.WDOGCONTROL.update(status);
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass


`endif//RKV_WATCHDOG_REG_DISABLE_INTR_SV

