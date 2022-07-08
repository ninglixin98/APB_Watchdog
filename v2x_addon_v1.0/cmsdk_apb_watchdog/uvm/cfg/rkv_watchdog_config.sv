`ifndef RKV_WATCHDOG_CONFIG_SV
`define RKV_WATCHDOG_CONFIG_SV

class rkv_watchdog_config extends uvm_object;

  apb_config apb_cfg;
  rkv_watchdog_rgm rgm;

  int seq_check_count;
  int seq_check_error;

  int scb_check_count;
  int scb_check_error;

  bit enable_scb = 1;
  bit enable_cov = 1;

  bit enable_scb_loadcounter_check = 0;

  virtual rkv_watchdog_if vif;

  `uvm_object_utils(rkv_watchdog_config)

  function new (string name = "rkv_watchdog_config");
    super.new(name);
    apb_cfg = apb_config::type_id::create("apb_cfg");
  endfunction : new



endclass

`endif // rkv_watchdog_config_SV
