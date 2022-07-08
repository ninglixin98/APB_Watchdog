`ifndef RKV_WATCHDOG_COV_SV
`define RKV_WATCHDOG_COV_SV

class rkv_watchdog_cov extends rkv_watchdog_subscriber;

  `uvm_component_utils(rkv_watchdog_cov)

  //covergroup definition below
  //T1 watchdog overall control
  //T1.1 interrupt disable and enable (0 -> 1, 1 -> 0)
  //T1.2 reset disable and enable (0 -> 1, 1 ->0)
  covergroup rkv_wdg_t1_overall_control_cg with function sample(bit [31:0] val, string field);//transfer in data when sample
    option.name = "T1 watchdog overall control";
    INTEN: coverpoint val iff (field == "INTEN") 
            {
              bins to_enable = {1'b0 => 1'b1};
              bins to_disable = {1'b1 => 1'b0};
            }
    RESEN: coverpoint val iff (field == "RESEN") 
            {
              bins to_enable = {1'b0 => 1'b1};
              bins to_disable = {1'b1 => 1'b0};
            }
  endgroup

  //T2 watchdog load and reload
  //T2.1 initial load (counter 0 -> loadval)
  //T2.2 reload form new value (loadval1 -> loadval2)
  //T2.3 loadval range (min, max and others)
  covergroup rkv_wdg_t2_load_reload_cg with function sample(bit [31:0] val);
    option.name = "T2 watchdog load and reload";
    /*INILOAD     : coverpoint val
                  {
                    bins iniload
                  }
    RELOAD      : coverpoint val
                  {
                    bins
                  }*/
    LOADRANGE   : coverpoint val
                  {
                    bins min = {32'h1};
                    bins max = {32'hFFFFFFFF};
                  }
  endgroup

  function new (string name = "rkv_watchdog_cov", uvm_component parent);
    super.new(name, parent);
    rkv_wdg_t1_overall_control_cg = new();
    rkv_wdg_t2_load_reload_cg = new();
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    enable = cfg.enable_cov;
  endfunction
  
  task do_listen_events();
    uvm_object tmp;
    uvm_reg r;
    fork
      forever begin
        wdg_regacc_e.wait_trigger_data(tmp);
        void'($cast(r, tmp));
        if(r.get_name() == "WDOGCONTROL") begin
          rkv_wdg_t1_overall_control_cg.sample(rgm.WDOGCONTROL.INTEN.get(), "INTEN");
          rkv_wdg_t1_overall_control_cg.sample(rgm.WDOGCONTROL.RESEN.get(), "RESEN");
        end
        else if(r.get_name() == "WDOGLOAD") begin
          rkv_wdg_t2_load_reload_cg.sample(rgm.WDOGINTCLR.INTCLR.get());
        end
        //todo : others branches
      end
    join_none
  endtask
  
endclass



`endif//RKV_WATCHDOG_COV_SV

