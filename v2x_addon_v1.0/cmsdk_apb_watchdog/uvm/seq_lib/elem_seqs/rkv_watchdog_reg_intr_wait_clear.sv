`ifndef RKV_WATCHDOG_REG_INTR_WAIT_CLEAR_SV
`define RKV_WATCHDOG_REG_INTR_WAIT_CLEAR_SV

class rkv_watchdog_reg_intr_wait_clear extends rkv_watchdog_base_element_sequence;
  rand int intval;//interval, jiange
  rand int delay;//yanchi
  constraint load_cstr{
    soft intval inside {[10:100]};
    soft delay inside {[1:10]};
  }
  `uvm_object_utils(rkv_watchdog_reg_intr_wait_clear)

  function new (string name = "rkv_watchdog_reg_intr_wait_clear");
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
    //clear interrupt
    rgm.WDOGINTCLR.write(status, 1'b1);
    //NOTE: avoid this way to clear due to RGM's update issue
    //rgm.WDOGINTCLR.INTCLR.set(1'b1);
    //rgm.WDOGINTCLR.update(status);
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass


`endif//RKV_WATCHDOG_REG_INTR_WAIT_CLEAR_SV

