module rkv_watchdog_tb;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import rkv_watchdog_pkg::*;

  bit apb_clk;
  bit apb_rstn;
  bit watchdog_clk;
  bit watchdog_rstn;

  cmsdk_apb_watchdog dut(
  
      .PCLK(apb_clk),                              // APB clock
      .PRESETn(apb_rstn),                          // APB reset
      .PENABLE(apb_if_inst.penable),               // APB enable
      .PSEL(apb_if_inst.psel),                     // APB periph select
      .PADDR(apb_if_inst.paddr[11:2]),             // APB address bus
      .PWRITE(apb_if_inst.pwrite),                 // APB write
      .PWDATA(apb_if_inst.pwdata),                 // APB write data

      .WDOGCLK(watchdog_clk),                      // Watchdog clock
      .WDOGCLKEN(1'b1),                            // Watchdog clock enable
      .WDOGRESn(watchdog_rstn),                    // Watchdog clock reset

      .ECOREVNUM(watchdog_if_inst.ecorevnum),      // ECO revision number

      .PRDATA(apb_if_inst.prdata),                 // APB read data

      .WDOGINT(watchdog_if_inst.wdogint),          // Watchdog interrupt
      .WDOGRES(watchdog_if_inst.wdogres)           // Watchdog timeout reset
  );

  rkv_watchdog_if watchdog_if_inst();

  apb_if apb_if_inst(apb_clk, apb_rstn);

  initial begin
    fork
      forever #5ns apb_clk <= !apb_clk;              //100MHZ
      forever #2ns watchdog_clk <= !watchdog_clk;    //250MHZ
    join
  end

  initial begin
    #2ns;
    apb_rstn <= 1;
    #20ns;
    apb_rstn <= 0;
    #20ns;
    apb_rstn <= 1;
  end
    
  assign watchdog_rstn = apb_rstn;

  initial begin
    uvm_config_db#(virtual apb_if)::set(uvm_root::get(), "uvm_test_top.env.apb_mst", "vif", apb_if_inst);
    uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top.env", "vif", watchdog_if_inst);
    uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top.env.virt_sqr", "vif", watchdog_if_inst);
    run_test("");

  end

endmodule
