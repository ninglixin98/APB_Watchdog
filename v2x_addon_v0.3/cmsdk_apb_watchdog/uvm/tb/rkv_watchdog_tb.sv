module rkv_watchdog_tb;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import rkv_watchdog_pkg::*;

bit apb_clk;
bit apb_rstn;
bit wdg_clk;
bit wdg_rstn;

cmsdk_apb_watchdog dut(
  .PCLK(apb_clk),                     // APB clock
  .PRESETn(apb_rstn),                 // APB reset
  .PENABLE(apb_if_inst.penable),      // APB enable
  .PSEL(apb_if_inst.psel),            // APB periph select
  .PADDR(apb_if_inst.paddr[11:2]),    // APB address bus
  .PWRITE(apb_if_inst.pwrite),        // APB write
  .PWDATA(apb_if_inst.pwdata),        // APB write data

  .WDOGCLK(wdg_clk),                  // Watchdog clock
  .WDOGCLKEN(1'b1),                   // Watchdog clock enable
  .WDOGRESn(wdg_rstn),                // Watchdog clock reset

  .ECOREVNUM(wdg_if_inst.ecorevnum),  // ECO revision number

  .PRDATA(apb_if_inst.prdata),        // APB read data

  .WDOGINT(wdg_if_inst.wdogint),      // Watchdog interrupt
  .WDOGRES(wdg_if_inst.wdogres)       // Watchdog timeout reset
);

apb_if apb_if_inst(apb_clk, apb_rstn);

rkv_watchdog_if wdg_if_inst();
assign wdg_if_inst.apb_clk =  apb_clk;
assign wdg_if_inst.apb_rstn = apb_rstn;
assign wdg_if_inst.wdg_clk = wdg_clk;
assign wdg_if_inst.wdg_rstn = wdg_rstn;



initial begin : clk_gen
  fork
    forever #5ns  apb_clk <= !apb_clk; // 100MHz
    forever #25ns wdg_clk <= !wdg_clk; // 20MHz
  join
end

initial begin : rstn_gen
  #2ns;
  apb_rstn <= 1;
  #20ns;
  apb_rstn <= 0;
  #20ns;
  apb_rstn <= 1;
end
assign wdg_rstn = apb_rstn;

initial begin : vif_assign
  uvm_config_db#(virtual apb_if)::set(uvm_root::get(), "uvm_test_top.env.apb_mst", "vif", apb_if_inst);
  uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top", "vif", wdg_if_inst);
  uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top.env", "vif", wdg_if_inst);
  uvm_config_db#(virtual rkv_watchdog_if)::set(uvm_root::get(), "uvm_test_top.env.virt_sqr", "vif", wdg_if_inst);
  run_test("");
end


endmodule
