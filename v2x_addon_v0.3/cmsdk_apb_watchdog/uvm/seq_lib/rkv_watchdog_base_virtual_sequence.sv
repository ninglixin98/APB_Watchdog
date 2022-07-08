`ifndef RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV
`define RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV

class rkv_watchdog_base_virtual_sequence extends uvm_sequence;
  
  apb_master_single_write_sequence apb_wr_seq;
  apb_master_single_read_sequence apb_rd_seq;
  apb_master_write_read_sequence apb_wr_rd_seq;
  rkv_watchdog_config cfg;
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
  
endclass

`endif//RKV_WATCHDOG_BASE_VIRTUAL_SEQUENCE_SV

