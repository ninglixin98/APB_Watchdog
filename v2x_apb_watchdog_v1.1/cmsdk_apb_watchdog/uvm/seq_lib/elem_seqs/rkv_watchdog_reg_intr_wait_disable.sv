`ifndef RKV_WATCHDOG_REG_INTR_WAIT_DISABLE_SV
`define RKV_WATCHDOG_REG_INTR_WAIT_DISABLE_SV

class rkv_watchdog_reg_intr_wait_disable extends rkv_watchdog_base_element_sequence;
  rand int intval;
  rand int delay;
  constraint load_cstr{
    soft intval inside {[10:100]};
    soft delay inside {[1:10]};
  }
  `uvm_object_utils(rkv_watchdog_reg_intr_wait_disable)

  function new (string name = "rkv_watchdog_reg_intr_wait_disable");
    super.new(name);
  endfunction

  task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //wait for interrupt
    forever begin
      rgm.WDOGMIS.mirror(status);
      if(rgm.WDOGMIS.INT.get()) break;
      //wait for interval
      repeat(intval) @(posedge vif.apb_clk);
    end
    //wait for delay
    repeat(delay) @(posedge vif.wdg_clk);
    //disable interrupt
    rgm.WDOGCONTROL.INTEN.set(1'b0);
    rgm.WDOGCONTROL.update(status);
    //NOTE: avoid this way to clear due to RGM's update issue
    //rgm.WDOGINTCLR.INTCLR.set(1'b1);
    //rgm.WDOGINTCLR.update(status);
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass

`endif//RKV_WATCHDOG_REG_INTR_WAIT_DISABLE_SV

