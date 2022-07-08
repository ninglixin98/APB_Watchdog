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
    rgm.WDOGPERIPHID0.read(status, rd_val);
    compare_data(rd_val, 'h24);
  
    rgm.WDOGPERIPHID1.read(status, rd_val);
    compare_data(rd_val, 'hB8);
    
    rgm.WDOGPERIPHID2.read(status, rd_val);
    compare_data(rd_val, 'h1B);
    
    rgm.WDOGPERIPHID3.read(status, rd_val);
    compare_data(rd_val, 'hB0);

    rgm.WDOGPERIPHID4.read(status, rd_val);
    compare_data(rd_val, 'h04);
    
    rgm.WDOGLOAD.read(status, rd_val);
    compare_data(rd_val, 'hFFFFFFFF);
    
    rgm.WDOGVALUE.read(status, rd_val);
    compare_data(rd_val, 'hFFFFFFFF);

    rgm.WDOGCONTROL.read(status, rd_val);
    compare_data(rd_val, 'h00);

    rgm.WDOGRIS.read(status, rd_val);
    compare_data(rd_val, 'h00);

    rgm.WDOGMIS.read(status, rd_val);
    compare_data(rd_val, 'h00);

    rgm.WDOGLOCK.read(status, rd_val);
    compare_data(rd_val, 'h00);

    rgm.WDOGITCR.read(status, rd_val);
    compare_data(rd_val, 'h00);

    `uvm_info("body", "Exiting...", UVM_LOW)

  endtask

endclass



`endif//RKV_WATCHDOG_REGACC_VIRT_SEQ_SV

