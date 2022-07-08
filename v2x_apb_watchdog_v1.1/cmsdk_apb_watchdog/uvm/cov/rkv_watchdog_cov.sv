`ifndef RKV_WATCHDOG_COV_SV
`define RKV_WATCHDOG_COV_SV

class rkv_watchdog_cov extends rkv_watchdog_subscriber;

  `uvm_component_utils(rkv_watchdog_cov)

  //covergroup definition below
  //T1 watchdog overall control
  //T1.1 interrupt disable and enable (0 -> 1, 1 -> 0)
  //T1.2 reset disable and enable (0 -> 1, 1 ->0)
  covergroup rkv_wdg_t1_overall_control_cg with function sample(bit val, string field);//sample is static, can not sample toggle =>
    option.name = "T1 watchdog overall control";
    INTEN: coverpoint val iff (field == "INTEN") 
            {
              bins enable_status = {1'b1};
              bins disable_status = {1'b0};
            }
    RESEN: coverpoint val iff (field == "RESEN") 
            {
              bins enable_status = {1'b1};
              bins disable_status = {1'b0};
            }
  endgroup

  /*covergroup rkv_wdg_t1_overall_control_clk_cg (ref bit [31:0] val) @(wdg_regacc_sve);//@ is dynamic, can sample toggle    
    option.name = "T1 watchdog overall control";
    INTEN: coverpoint val[0]  
            {
              bins enable_stat = {1'b1};
              bins disable_stat = {1'b0};
              bins to_enable = (1'b0 => 1'b1);
              bins to_disable = (1'b1 => 1'b0);
            }
    RESEN: coverpoint val[1]  
            {
              bins enable_stat = {1'b1};
              bins disable_stat = {1'b0};
              bins to_enable = (1'b0 => 1'b1);
              bins to_disable = (1'b1 => 1'b0);
            }
  endgroup*/

  //T2 watchdog load and reload
  //T2.1 initial load (counter 0 -> loadval)
  //T2.2 reload form new value (loadval1 -> loadval2)
  //T2.3 loadval range (min, max and others)
  covergroup rkv_wdg_t2_load_reload_cg with function sample(bit [31:0] val);
    option.name = "T2 watchdog load and reload";
    INILOAD     : coverpoint val
                  {
                    bins iniload = (32'hFFFFFFFF => [1:32'hFFFFFFFF]);
                  }
    RELOAD      : coverpoint val
                  {
                    bins reload = ([1:32'hFFFFFFFF] => [1:32'hFFFFFFFF]);
                  }
    LOADRANGE   : coverpoint val
                  {
                    bins min = {32'h1};
                    bins max = {32'hFFFFFFFF};
                    bins others = {[32'h2: 32'hFFFFFFFE]};
                  }
  endgroup

  //T3 watchdog interrupt assert or not assert
  covergroup rkv_wdg_t3_intr_clr_cg @(wdg_posedge_clk);
    option.name  = "T3 watchdog interrupt clear";
    coverpoint rgm.WDOGMIS.INT.get() 
    {
      bins interrupt_assert = {1'b1};
      bins interrupt_not_assert = {1'b0};
    }
  endgroup

  //T4 watchdog reg access
  covergroup rkv_wdg_t4_regacc_cg with function sample(apb_transfer tr);
    option.name = "T4 watchdog reg access";
    coverpoint tr.addr
    {
      bins wdogload = {32'h0};
      bins wdogvalue = {32'h04};
      bins wdogcontrol = {32'h08};
      bins wdogintclr = {32'h0C};
      bins wdogris = {32'h10};
      bins wdogmis = {32'h14};
      bins wdoglock = {32'hC00};
      bins wdogitcr = {32'hF00};
      bins wdogitop = {32'hF04};
      bins wdogperiphid4 = {32'hFD0};
      bins wdogperiphid0 = {32'hFE0};
      bins wdogperiphid1 = {32'hFE4};
      bins wdogperiphid2 = {32'hFE8};
      bins wdogperiphid3 = {32'hFEC};
      bins erroraddr = default;
    }
  endgroup

  //T5 watchdog integration mode on and off
  covergroup rkv_wdg_t5_integration_cg with function sample(bit val);
    option.name = "T5 watchdog integration mode on and off";
    coverpoint val
    {
      bins integration_on = {1'b1};
      bins integration_off = {1'b0};
    }
  endgroup

  //T6 watchdog integration to test
  covergroup rkv_wdg_t6_integration_test_cg with function sample(bit val, string field);
    option.name = "T6 watchdog integration test";
    WDOGRES:  coverpoint val iff (field == "WDOGRES")
              {
                bins set_reset2high = {1'b1};
                bins set_reset2low = {1'b0};
              }
    WDOGINT:  coverpoint val iff (field == "WDOGINT")
              {
                bins set_int2high = {1'b1};
                bins set_int2low = {1'b0};
              }
  endgroup
  
  //T7 watchdog lock and unlock
  covergroup rkv_wdg_t7_lock_unlock_cg with function sample(bit val);
    option.name = "T6 watchdog registers lock and unlock";
    coverpoint val
    {
      bins reg_lock = {1'b1};
      bins reg_unlock = {1'b0};
    }
  endgroup
  
  function new (string name = "rkv_watchdog_cov", uvm_component parent);
    super.new(name, parent);
    rkv_wdg_t1_overall_control_cg = new();
    rkv_wdg_t2_load_reload_cg = new();
    rkv_wdg_t3_intr_clr_cg = new();
    rkv_wdg_t4_regacc_cg = new();
    rkv_wdg_t5_integration_cg = new();
    rkv_wdg_t6_integration_test_cg = new();
    rkv_wdg_t7_lock_unlock_cg = new();
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task do_listen_events();
    uvm_object tmp;
    uvm_reg r;
    uvm_object tmp_tr;
    apb_transfer tr;
    fork
      forever begin
        wait(cfg.enable_cov);
        wdg_transfer.wait_trigger_data(tmp_tr);
        void'($cast(tr, tmp_tr));
        rkv_wdg_t4_regacc_cg.sample(tr);
        wdg_regacc_e.wait_trigger_data(tmp);
        void'($cast(r, tmp));
        if(r.get_name() == "WDOGCONTROL") begin
          rkv_wdg_t1_overall_control_cg.sample(rgm.WDOGCONTROL.INTEN.get(), "INTEN");
          rkv_wdg_t1_overall_control_cg.sample(rgm.WDOGCONTROL.RESEN.get(), "RESEN");
        end
        else if(r.get_name() == "WDOGLOAD") begin
          rkv_wdg_t2_load_reload_cg.sample(rgm.WDOGLOAD.LOADVAL.get());
        end
        else if(r.get_name() == "WDOGITCR") begin
          rkv_wdg_t5_integration_cg.sample(rgm.WDOGITCR.ITME.get());
        end
        else if(r.get_name() == "WDOGITOP") begin
          rkv_wdg_t6_integration_test_cg.sample(rgm.WDOGITOP.WDOGRES.get(), "WDOGRES");
          rkv_wdg_t6_integration_test_cg.sample(rgm.WDOGITOP.WDOGINT.get(), "WDOGINT");
        end
        else if(r.get_name() == "WDOGLOCK") begin
          rkv_wdg_t7_lock_unlock_cg.sample(rgm.WDOGLOCK.WRACC.get());
        end
      end
    join_none
  endtask
  
endclass



`endif//RKV_WATCHDOG_COV_SV

