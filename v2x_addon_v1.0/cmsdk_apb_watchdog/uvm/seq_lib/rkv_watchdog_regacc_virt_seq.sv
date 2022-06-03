`ifndef RKV_WATCHDOG_REGACC_VIRT_SEQ_SV
`define RKV_WATCHDOG_REGACC_VIRT_SEQ_SV

class rkv_watchdog_regacc_virt_seq extends rkv_watchdog_base_virtual_sequence;
  `uvm_object_utils(rkv_watchdog_regacc_virt_seq)

  function new (string name = "rkv_watchdog_regacc_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    // TODO in sub-class
    // access with rgm
    //`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFE0;})
    rgm.WDOGPERIPHID0.read(status, rd_val);
    compare_data(rd_val, 'h24);
    //`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFE4;})
    rgm.WDOGPERIPHID1.read(status, rd_val);
    compare_data(rd_val, 'hB8);
    //`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFE8;})
    rgm.WDOGPERIPHID2.read(status, rd_val);
    compare_data(rd_val, 'h1B);
    //`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFEC;})
    rgm.WDOGPERIPHID3.read(status, rd_val);
    compare_data(rd_val, 'hB0);
    //`uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass



`endif//RKV_WATCHDOG_REGACC_VIRT_SEQ_SV

