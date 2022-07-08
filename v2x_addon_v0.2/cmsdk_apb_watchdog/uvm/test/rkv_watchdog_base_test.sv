`ifndef RKV_WATCHDOG_BASE_TEST_SV
`define RKV_WATCHDOG_BASE_TEST_SV

virtual class rkv_watchdog_base_test extends uvm_test;
  rkv_watchdog_env env;
  //`uvm_component_utils(rkv_watchdog_base_test)

  function new (string name = "rkv_watchdog_base_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    this.env = rkv_watchdog_env::type_id::create("env", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
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
  endtask

endclass

`endif//RKV_WATCHDOG_BASE_TEST_SV

