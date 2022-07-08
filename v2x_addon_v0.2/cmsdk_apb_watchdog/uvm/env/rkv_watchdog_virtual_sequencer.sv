`ifndef RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV
`define RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV

class rkv_watchdog_virtual_sequencer extends uvm_sequencer;
  apb_master_sequencer apb_mst_sqr;
  `uvm_component_utils(rkv_watchdog_virtual_sequencer);
  
  function new (string name = "rkv_watchdog_virtual_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass


`endif//RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV

