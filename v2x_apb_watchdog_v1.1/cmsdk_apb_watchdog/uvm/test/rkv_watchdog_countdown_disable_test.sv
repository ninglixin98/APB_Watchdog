`ifndef RKV_WATCHDOG_COUNTDOWN_DISABLE_TEST_SV
`define RKV_WATCHDOG_COUNTDOWN_DISABLE_TEST_SV

class rkv_watchdog_countdown_disable_test extends rkv_watchdog_base_test;

  `uvm_component_utils(rkv_watchdog_countdown_disable_test)

  function new (string name = "rkv_watchdog_countdown_disable_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    rkv_watchdog_countdown_disable_virt_seq seq = rkv_watchdog_countdown_disable_virt_seq::type_id::create("this");
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.virt_sqr);
    phase.drop_objection(this);
  endtask

endclass




`endif//RKV_WATCHDOG_COUNTDOWN_DISABLE_TEST_SV

