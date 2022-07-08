`ifndef RKV_WATCHDOG_RESEN_VIRT_SEQ_SV
`define RKV_WATCHDOG_RESEN_VIRT_SEQ_SV

class rkv_watchdog_resen_virt_seq extends rkv_watchdog_base_virtual_sequence;
  `uvm_object_utils(rkv_watchdog_resen_virt_seq)

  function new (string name = "rkv_watchdog_resen_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //enable watchdog and interrupt
    `uvm_do(reg_enable_intr)
    //enable reset
    `uvm_do(reg_enable_reset)
    //write load
    `uvm_do_with(reg_loadcount, {load_val == 'hFF;})
    //clear interrupt
    //`uvm_do_with(reg_intr_wait_clear, {intval == 50; delay == 1;})
    
    fork
      wait_intr_signal_assertted();
      wait_reset_signal_assertted();
    join
    #100us;
    
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass



`endif//RKV_WATCHDOG_RESEN_VIRT_SEQ_SV

