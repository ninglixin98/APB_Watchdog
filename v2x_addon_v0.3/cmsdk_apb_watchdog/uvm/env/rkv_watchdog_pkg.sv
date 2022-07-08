`ifndef RKV_WATCHDOG_PKG_SV
`define RKV_WATCHDOG_PKG_SV

package rkv_watchdog_pkg;
  
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import apb_pkg::*;

  `include "rkv_watchdog_config.svh"
  `include "rkv_watchdog_cov.svh"
  `include "rkv_watchdog_reg.svh"

  `include "rkv_watchdog_virtual_sequencer.sv"
  `include "rkv_watchdog_env.sv"

  `include "rkv_watchdog_seq_lib.svh"
  `include "rkv_watchdog_tests.svh"

endpackage

`endif//RKV_WATCHDOG_PKG_SV

