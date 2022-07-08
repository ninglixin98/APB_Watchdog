`ifndef RKV_WATCHDOG_BASE_TEST_SV
`define RKV_WATCHDOG_BASE_TEST_SV

virtual class rkv_watchdog_base_test extends uvm_test;
  rkv_watchdog_config cfg;
  rkv_watchdog_env env;
  rkv_watchdog_rgm rgm;

  function new (string name = "rkv_watchdog_base_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //create rgm
    rgm = rkv_watchdog_rgm::type_id::create("rgm", this);
    rgm.build();
    //set rgm to env
    uvm_config_db#(rkv_watchdog_rgm)::set(this, "env", "rgm", rgm);
    //create cfg
    cfg = rkv_watchdog_config::type_id::create("cfg");
    //connect cfg.rgm to rgm
    cfg.rgm = rgm;
    //get cfg.vif from top
    if(!uvm_config_db#(virtual rkv_watchdog_if)::get(this,"","vif", cfg.vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    //set cfg to env
    uvm_config_db#(rkv_watchdog_config)::set(this, "env", "cfg", cfg);
    env = rkv_watchdog_env::type_id::create("env", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.phase_done.set_drain_time(this, 1us);
    phase.raise_objection(this);
    do_init_clks();
    do_init_regs();
    phase.drop_objection(this);
  endtask

  virtual task do_init_clks();
  endtask

  virtual task do_init_regs();
    repeat(10) @(posedge cfg.vif.apb_clk);
  endtask

endclass

`endif//RKV_WATCHDOG_BASE_TEST_SV

