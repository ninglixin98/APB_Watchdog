`ifndef RKV_WATCHDOG_LOCK_VIRT_SEQ_SV
`define RKV_WATCHDOG_LOCK_VIRT_SEQ_SV

class rkv_watchdog_lock_virt_seq extends rkv_watchdog_base_virtual_sequence;
  `uvm_object_utils(rkv_watchdog_lock_virt_seq)

  function new (string name = "rkv_watchdog_lock_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    // TODO in sub-class
    // normal access by default status(unlock)
    check_wdog_unlock_contorl_status();

    //lock registers
    rgm.WDOGLOCK.write(status, 1'b1 << 1);
    rgm.WDOGLOCK.mirror(status);
    compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b1);
    //check locked control register status
    check_wdog_lock_contorl_status();

    //unlock registers
    rgm.WDOGLOCK.write(status, 'h1ACCE551);
    rgm.WDOGLOCK.mirror(status);
    compare_data(rgm.WDOGLOCK.WRACC.get(), 1'b0);
    //check unlocked control register status
    check_wdog_unlock_contorl_status();

  endtask

  task check_wdog_unlock_contorl_status();
    //check set 1
    rgm.WDOGCONTROL.INTEN.set(1'b1);
    rgm.WDOGCONTROL.update(status);
    rgm.WDOGCONTROL.mirror(status);
    compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b1);
    //check set 0
    rgm.WDOGCONTROL.INTEN.set(1'b0);
    rgm.WDOGCONTROL.update(status);
    rgm.WDOGCONTROL.mirror(status);
    compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b0);
  endtask

  task check_wdog_lock_contorl_status();
    //check set 1
    rgm.WDOGCONTROL.INTEN.set(1'b1);
    rgm.WDOGCONTROL.update(status);
    rgm.WDOGCONTROL.mirror(status);
    compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b0);
    //check set 0
    rgm.WDOGCONTROL.INTEN.set(1'b0);
    rgm.WDOGCONTROL.update(status);
    rgm.WDOGCONTROL.mirror(status);
    compare_data(rgm.WDOGCONTROL.INTEN.get(), 1'b0);
  endtask

endclass



`endif//RKV_WATCHDOG_LOCK_VIRT_SEQ_SV

