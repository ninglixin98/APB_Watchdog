`ifndef RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV
`define RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV


class rkv_watchdog_base_virtual_sequence extends uvm_sequence;
  
  apb_master_single_write_sequence apb_wr_seq;
  apb_master_single_read_sequence apb_rd_seq;
  apb_master_write_read_sequence apb_wr_rd_seq;

  rkv_watchdog_reg_enable_intr reg_enable_intr;
  rkv_watchdog_reg_intr_wait_clear reg_intr_wait_clear;
  rkv_watchdog_reg_loadcount reg_loadcount;
  rkv_watchdog_reg_enable_reset reg_enable_reset;
  rkv_watchdog_reg_disable_intr reg_disable_intr;
  rkv_watchdog_reg_intr_wait_disable reg_intr_wait_disable;

  rkv_watchdog_config cfg;
  virtual rkv_watchdog_if vif;
  rkv_watchdog_rgm rgm;
  bit[31:0] wr_val, rd_val;
  uvm_status_e status;

  `uvm_object_utils(rkv_watchdog_base_virtual_sequence)
  `uvm_declare_p_sequencer(rkv_watchdog_virtual_sequencer)

  function new (string name = "rkv_watchdog_base_virtual_sequence");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info("body", "Entered...", UVM_LOW)
    //to do
    //get cfg from p_sequencer(virtual sequencer)
    cfg = p_sequencer.cfg;
    //get vif and rgm from cfg
    vif = cfg.vif;
    rgm = cfg.rgm;
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

  //compare data
  virtual function void compare_data(logic[31:0] val1, logic[31:0] val2);
    cfg.seq_check_count++;
    if(val1 == val2)       
      `uvm_info("CMPSUC", $sformatf("val1 'h%0x === val2 'h%0x", val1, val2), UVM_LOW)
    else begin
      cfg.seq_check_error++;
      `uvm_error("CMPERR", $sformatf("val1 'h%0x !== val2 'h%0x", val1, val2))
    end
  endfunction

  task wait_intr_signal_assertted();
    @(posedge vif.wdogint);
  endtask

  task wait_intr_signal_released();
    @(negedge vif.wdogint);
  endtask

  task wait_reset_signal_assertted();
    @(posedge vif.wdogres);
  endtask

  task wait_reset_signal_released();
    @(posedge vif.wdogres);
  endtask

  
endclass

`endif//RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV

