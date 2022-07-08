`ifndef RKV_WATCHDOG_SCOREBOARD
`define RKV_WATCHDOG_SCOREBOARD

class rkv_watchdog_scoreboard extends rkv_watchdog_subscriber;

  bit wdg_inten = 0;
  bit wdg_resen = 0;

  bit [31:0] cur_load;
  bit [31:0] cur_count;

  //events of scoreboard
  uvm_event wdg_disable_loadcount_check_e;

  typedef enum {CHECK_LOADCOUNTER} check_type_e;
  
  `uvm_component_utils(rkv_watchdog_scoreboard)

  function new (string name = "rkv_watchdog_scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wdg_disable_loadcount_check_e = _ep.get("wdg_disable_loadcount_check_e");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    do_countdown_check();
  endtask

  //control check enable and disable
  task do_listen_events();
    fork
      forever begin
        wdg_inten_e.wait_trigger();
        wdg_inten = 1;
      end

      forever begin
        wdg_resen_e.wait_trigger();
        wdg_resen = 1;
      end

      forever begin: wait_wdg_reload_thread
        wdg_load_e.wait_trigger();
        wdg_disable_loadcount_check_e.trigger();
        cfg.enable_scb_loadcounter_check = 1;
      end

      forever begin: wait_intrclr_thread
        wdg_intrclr_e.wait_trigger();
        wdg_disable_loadcount_check_e.trigger();
        cfg.enable_scb_loadcounter_check = 1;
      end
    join_none
  endtask

  //do check
  virtual task do_countdown_check();
    fork
      forever begin
        wdg_disable_loadcount_check_e.wait_trigger();
        disable do_loadcounter_check_thread;
      end
      
      forever begin
        begin: do_loadcounter_check_thread
          do_loadcounter_check();
        end
      end
    join_none
  endtask
  
  //check's task
  virtual task do_loadcounter_check();
    bit check_enable = get_check_enable(CHECK_LOADCOUNTER);
    bit intr_checked = 0;
    bit res_checked = 0;
    forever begin
      //from apb clk to watchdog clk sync
      @(posedge vif.wdg_clk iff check_enable);
      cur_load = rgm.WDOGLOAD.LOADVAL.get();
      cur_count = cur_load;
      do begin
        @(posedge vif.wdg_clk);
        cur_count--;
      end while(cur_count != 0);
      wdg_intr_assert_e.trigger();
      //from logic time after count reach 0
      repeat(2) @(negedge vif.wdg_clk);

      if(!res_checked) begin //do not check if once reset have been checked
        if(!intr_checked || !wdg_resen) begin //if interrupt have not been checked or reset is disable, check the interrupt 
          if(vif.wdogint != 1'b1) begin 
            cfg.scb_check_error++;
            `uvm_error("COUNTDOWNCHECK", "WDOGINT single should be assertted!");
          end
          intr_checked = 1;
        end
        else begin //else check reset
          if(vif.wdogres != 1'b1) begin 
            cfg.scb_check_error++;
            `uvm_error("COUNTDOWNCHECK", "WDOGRES single should be assertted!");
          end
          res_checked = 1;
        end
        cfg.scb_check_count++;
      end
    end
  endtask

  virtual function bit get_check_enable(check_type_e typ);
    case(typ)
      CHECK_LOADCOUNTER: return cfg.enable_scb && cfg.enable_scb_loadcounter_check && wdg_inten;
      default: return 0;
    endcase
  endfunction

endclass

`endif//RKV_WATCHDOG_SCOREBOARD

