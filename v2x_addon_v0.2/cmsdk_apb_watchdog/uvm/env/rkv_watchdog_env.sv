`ifndef RKV_WATCHDOG_ENV_SV
`define RKV_WATCHDOG_ENV_SV

class rkv_watchdog_env extends uvm_env;
  apb_master_agent apb_mst;
  rkv_watchdog_virtual_sequencer virt_sqr;
  `uvm_component_utils(rkv_watchdog_env)

  function new (string name = "rkv_watchdog_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    this.apb_mst = apb_master_agent::type_id::create("apb_mst", this);
    this.virt_sqr = rkv_watchdog_virtual_sequencer::type_id::create("virt_sqr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virt_sqr.apb_mst_sqr = apb_mst.sequencer;
  endfunction

endclass


`endif//RKV_WATCHDOG_ENV_SV

