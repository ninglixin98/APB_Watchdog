`ifndef RKV_WATCHDOG_REG_LOADCOUNT_SV
`define RKV_WATCHDOG_REG_LOADCOUNT_SV

class rkv_watchdog_reg_loadcount extends rkv_watchdog_base_element_sequence;
  rand bit[31:0] load_val;
  constraint load_cstr{
    soft load_val inside {['h1:'hFFFF]};
  }
  `uvm_object_utils(rkv_watchdog_reg_loadcount)

  function new (string name = "rkv_watchdog_reg_loadcount");
    super.new(name);
  endfunction

  task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //write load
    rgm.WDOGLOAD.mirror(status);
    vif.wait_apb(1);
    rgm.WDOGLOAD.write(status, load_val);
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass

`endif//RKV_WATCHDOG_REG_LOADCOUNT_SV

