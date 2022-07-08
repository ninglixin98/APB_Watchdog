`ifndef RKV_WATCHDOG_ENV_SV
`define RKV_WATCHDOG_ENV_SV

class rkv_watchdog_env extends uvm_env;
  apb_master_agent apb_mst;
  rkv_watchdog_virtual_sequencer virt_sqr;
  rkv_watchdog_config cfg;
  `uvm_component_utils(rkv_watchdog_env)

  function new (string name = "rkv_watchdog_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //get config handle from test layer
    if(!uvm_config_db#(rkv_watchdog_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get cfg handle from config DB")
    end
    //set config handle to virt_sqr and apb_mst 
    uvm_config_db#(rkv_watchdog_config)::set(this, "virt_sqr", "cfg", cfg);
    uvm_config_db#(apb_config)::set(this, "apb_mst", "cfg", cfg.apb_cfg);
    this.apb_mst = apb_master_agent::type_id::create("apb_mst", this);
    this.virt_sqr = rkv_watchdog_virtual_sequencer::type_id::create("virt_sqr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //connect sequencer to virtual sequencer
    virt_sqr.apb_mst_sqr = apb_mst.sequencer;
  endfunction

  //report check results
  function void report_phase(uvm_phase phase);
    string reports = "\n";
    super.report_phase(phase);
    reports = {reports, $sformatf("====================================== \n")};//only {} allow
    reports = {reports, $sformatf("CURRENT TEST SUMMARY \n")};
    reports = {reports, $sformatf("SEQUENCE CHECK COUNT: %0d \n", cfg.seq_check_count)};
    reports = {reports, $sformatf("SEQUENCE CHECK ERROR: %0d \n", cfg.seq_check_error)};
    reports = {reports, $sformatf("SCOREBOARD CHECK COUNT: %0d \n", cfg.scb_check_count)};
    reports = {reports, $sformatf("SCOREBOARD CHECK ERROR: %0d \n", cfg.scb_check_error)};
    reports = {reports, $sformatf("====================================== \n")};
    `uvm_info("TEST_SUMMARY", reports, UVM_LOW)
  endfunction

endclass


`endif//RKV_WATCHDOG_ENV_SV

