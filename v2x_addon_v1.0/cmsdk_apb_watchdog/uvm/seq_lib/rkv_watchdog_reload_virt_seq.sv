`ifndef RKV_WATCHDOG_RELOAD_VIRT_SEQ_SV
`define RKV_WATCHDOG_RELOAD_VIRT_SEQ_SV

class rkv_watchdog_reload_virt_seq extends rkv_watchdog_base_virtual_sequence;
  `uvm_object_utils(rkv_watchdog_reload_virt_seq)

  function new (string name = "rkv_watchdog_reload_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //enable watchdog and interrupt
    `uvm_do(reg_enable_intr)
    //write load
    `uvm_do_with(reg_loadcount, {load_val == 'hFF;})
    //clear interrupt
    repeat(2) begin
      fork
        `uvm_do_with(reg_intr_wait_clear, {intval == 50; delay inside {[30:40]};})
        wait_intr_signal_released();
      join
      `uvm_do_with(reg_loadcount, {load_val inside {['hA0:'hFF]};})
    end
    
    /*   
    //enable watchdog and interrupt
    rgm.WDOGCONTROL.INTEN.set(1'b1);
    rgm.WDOGCONTROL.update(status);
    //write load
    rgm.WDOGLOAD.write(status, 'hFF);
    //read load and value
    repeat(10) begin
      rgm.WDOGLOAD.read(status, rd_val);
      `uvm_info("REGREAD", $sformatf("WDOGLOAD value is %0x", rd_val), UVM_LOW)
      rgm.WDOGVALUE.read(status, rd_val);
      `uvm_info("REGREAD", $sformatf("WDOGVALUE value is %0x", rd_val), UVM_LOW)
    end
    #100us;
    */
   
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass



`endif//RKV_WATCHDOG_RELOAD_VIRT_SEQ_SV

