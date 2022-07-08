`ifndef RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV
`define RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV

class rkv_watchdog_virtual_sequencer extends uvm_sequencer;
  
  apb_master_sequencer apb_mst_sqr;
  rkv_watchdog_config cfg;
  `uvm_component_utils(rkv_watchdog_virtual_sequencer);
  
  function new (string name = "rkv_watchdog_virtual_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //get config handle from env layer
    if(!uvm_config_db#(rkv_watchdog_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get cfg handle from config DB")
    end
  endfunction


endclass


`endif//RKV_WATCHDOG_VIRTUAL_SEQUENCER_SV

