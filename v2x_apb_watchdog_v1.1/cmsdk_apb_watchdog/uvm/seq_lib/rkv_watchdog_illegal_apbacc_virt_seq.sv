`ifndef RKV_WATCHDOG_ILLEGAL_APBACC_VIRT_SEQ_SV
`define RKV_WATCHDOG_ILLEGAL_APBACC_VIRT_SEQ_SV

class rkv_watchdog_illegal_apbacc_virt_seq extends rkv_watchdog_base_virtual_sequence;
  `uvm_object_utils(rkv_watchdog_illegal_apbacc_virt_seq)

  function new (string name = "rkv_watchdog_illegal_apbacc_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)
    // TODO in sub-class
    //access with illegal address 
    //`uvm_do_on_with(apb_rd_seq, p_sequencer.apb_mst_sqr, {addr == 32'h03;})
    //compare_data(apb_rd_seq.data, 'h00);
    
    //access RO with write
    rgm.WDOGPERIPHID0.write(status, 'h08);
    rgm.WDOGPERIPHID0.read(status, rd_val);
    compare_data(rd_val, 'h24);

    rgm.WDOGPERIPHID1.write(status, 'h08);
    rgm.WDOGPERIPHID1.read(status, rd_val);
    compare_data(rd_val, 'hB8);

    rgm.WDOGPERIPHID2.write(status, 'h08);
    rgm.WDOGPERIPHID2.read(status, rd_val);
    compare_data(rd_val, 'h1B);

    rgm.WDOGPERIPHID3.write(status, 'h08);
    rgm.WDOGPERIPHID3.read(status, rd_val);
    compare_data(rd_val, 'hB0);

    rgm.WDOGPERIPHID4.write(status, 'h08);
    rgm.WDOGPERIPHID4.read(status, rd_val);
    compare_data(rd_val, 'h04);
    
    rgm.WDOGVALUE.write(status, 'h08);
    rgm.WDOGVALUE.read(status, rd_val);
    compare_data(rd_val, 'hFFFFFFFF);

    rgm.WDOGRIS.write(status, 'h08);
    rgm.WDOGRIS.read(status, rd_val);
    compare_data(rd_val, 'h00);

    rgm.WDOGMIS.write(status, 'h08);
    rgm.WDOGMIS.read(status, rd_val);
    compare_data(rd_val, 'h00);

    //access WO with read
    rgm.WDOGINTCLR.read(status, rd_val);
    compare_data(rd_val, 'h00);

    rgm.WDOGITOP.read(status, rd_val);
    compare_data(rd_val, 'h00);
    
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass


`endif//RKV_WATCHDOG_ILLEGAL_APBACC_VIRT_SEQ_SV

