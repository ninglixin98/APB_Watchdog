`ifndef RKV_WATCHDOG_APBACC_VIRT_SEQ_SV
`define RKV_WATCHDOG_APBACC_VIRT_SEQ_SV

class rkv_watchdog_apbacc_virt_seq extends rkv_watchdog_base_virtual_sequence;
  `uvm_object_utils(rkv_watchdog_apbacc_virt_seq)

  function new (string name = "rkv_watchdog_apbacc_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    // TODO in sub-class
    // inline constraint with APB address, data
    `uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFE0;})
    compare_data(apb_rd_seq.data, 'h24);
    `uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFE4;})
    compare_data(apb_rd_seq.data, 'hB8);
    `uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFE8;})
    compare_data(apb_rd_seq.data, 'h1B);
    `uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 'hFEC;})
    compare_data(apb_rd_seq.data, 'hB0);
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass


`endif//RKV_WATCHDOG_APBACC_VIRT_SEQ_SV

