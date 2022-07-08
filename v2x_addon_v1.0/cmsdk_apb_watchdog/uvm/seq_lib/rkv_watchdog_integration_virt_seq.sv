`ifndef RKV_WATCHDOG_INTEGRATION_VIRT_SEQ_SV
`define RKV_WATCHDOG_INTEGRATION_VIRT_SEQ_SV

class rkv_watchdog_integration_virt_seq extends rkv_watchdog_base_virtual_sequence;
  
  `uvm_object_utils(rkv_watchdog_integration_virt_seq)
  
  function new (string name = "rkv_watchdog_integration_virt_seq");
    super.new(name);
  endfunction

  task body();
    super.body();
    `uvm_info("INTGTEST", "Entered...", UVM_LOW)
    //check default interrupt and reset value
    `uvm_info("INTGTEST", "check default interrupt and reset value", UVM_LOW)
    compare_data(vif.wdogint, 1'b0);
    compare_data(vif.wdogres, 1'b0);
    //enable integration mode
    `uvm_info("INTGTEST", "enable integration mode", UVM_LOW)
    rgm.WDOGITCR.ITME.set(1'b1);
    rgm.WDOGITCR.update(status);

    `uvm_info("INTGTEST", "check interrupt and reset value", UVM_LOW)
    //set interrupt and reset value to 1
    rgm.WDOGITOP.WDOGINT.set(1'b1);
    rgm.WDOGITOP.WDOGRES.set(1'b1);
    rgm.WDOGITOP.update(status);
    //check interrupt and reset value
    compare_data(vif.wdogint, 1'b1);
    compare_data(vif.wdogres, 1'b1);

    //set interrupt and reset value to 0
    rgm.WDOGITOP.WDOGINT.set(1'b0);
    rgm.WDOGITOP.WDOGRES.set(1'b0);
    rgm.WDOGITOP.update(status);
    //check interrupt and reset value
    compare_data(vif.wdogint, 1'b0);
    compare_data(vif.wdogres, 1'b0);

    //============== Check whether the control is still effective after the disable integration mode ==================
   `uvm_info("INTGTEST", "============== Check whether the control is still effective after the disable integration mode ==================", UVM_LOW)

    //set interrupt and reset value to 1
    rgm.WDOGITOP.WDOGINT.set(1'b1);
    rgm.WDOGITOP.WDOGRES.set(1'b1);
    rgm.WDOGITOP.update(status);
    //check default interrupt and reset value
    compare_data(vif.wdogint, 1'b1);
    compare_data(vif.wdogres, 1'b1);

    //disable integration modecd
    `uvm_info("INTGTEST", "disable integration mode", UVM_LOW)
    rgm.WDOGITCR.ITME.set(1'b0);
    rgm.WDOGITCR.update(status);

    //check default interrupt and reset value
    compare_data(vif.wdogint, 1'b0);
    compare_data(vif.wdogres, 1'b0);

    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask


endclass

`endif//RKV_WATCHDOG_INTEGRATION_VIRT_SEQ_SV

