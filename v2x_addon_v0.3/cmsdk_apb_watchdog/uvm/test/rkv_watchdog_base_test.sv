`ifndef RKV_WATCHDOG_BASE_TEST_SV
`define RKV_WATCHDOG_BASE_TEST_SV

virtual class rkv_watchdog_base_test extends uvm_test;
  rkv_watchdog_config cfg;
  rkv_watchdog_env env;

  function new (string name = "rkv_watchdog_base_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg = rkv_watchdog_config::type_id::create("cfg");
    if(!uvm_config_db#(virtual rkv_watchdog_if)::get(this,"","vif", cfg.vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    uvm_config_db#(rkv_watchdog_config)::set(this, "env", "cfg", cfg);
    env = rkv_watchdog_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
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

