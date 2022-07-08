`ifndef RKV_WATCHDOG_SUBSCRIBER_SV
`define RKV_WATCHDOG_SUBSCRIBER_SV

/** Macro that define analysis ports with unique suffixes */
`uvm_analysis_imp_decl(_apb)

class rkv_watchdog_subscriber extends uvm_component;

  //apb analyse import
  uvm_analysis_imp_apb #(apb_transfer, rkv_watchdog_subscriber) apb_trans_observed_imp;

  //events
  uvm_event wdg_regacc_fd_e;
  uvm_event wdg_regacc_bd_e;
  uvm_event wdg_inten_e;
  uvm_event wdg_resen_e;
  uvm_event wdg_load_e;
  uvm_event wdg_intr_assert_e;
  uvm_event wdg_intr_release_e;
  uvm_event wdg_intrclr_e;
  uvm_event wdg_regacc_e;
  uvm_event wdg_transfer;
  event wdg_posedge_clk;

  protected uvm_event_pool _ep;
  
  rkv_watchdog_config cfg;
  rkv_watchdog_rgm rgm;
  virtual rkv_watchdog_if vif;

  `uvm_component_utils(rkv_watchdog_subscriber)

  function new (string name = "rkv_watchdog_subscriber", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    apb_trans_observed_imp = new("apb_trans_observed_imp", this);
    //get config handle from test layer
    if(!uvm_config_db#(rkv_watchdog_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get cfg handle from config DB")
    end

    vif = cfg.vif;
    rgm = cfg.rgm;

    //local event pool
    _ep = new("_ep");
    wdg_inten_e = _ep.get("wdg_inten_e");
    wdg_resen_e = _ep.get("wdg_resen_e");
    wdg_load_e = _ep.get("wdg_load_e");
    wdg_regacc_fd_e = _ep.get("wdg_regacc_fd_e");
    wdg_regacc_bd_e = _ep.get("wdg_regacc_bd_e");
    wdg_intr_assert_e = _ep.get("wdg_intr_assert_e");
    wdg_intr_release_e = _ep.get("wdg_intr_release_e");
    wdg_intrclr_e = _ep.get("wdg_intrclr_e");
    wdg_regacc_e = _ep.get("wdg_regacc_e");
    wdg_transfer = _ep.get("wdg_transfer");
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    do_events_trigger();
    do_listen_events();
  endtask

  //analyse port write function
  virtual function void write_apb(apb_transfer tr);
    uvm_reg r;
    r = cfg.rgm.map.get_reg_by_offset(tr.addr);
    wdg_regacc_fd_e.trigger(r);
    wdg_transfer.trigger(tr);
  endfunction: write_apb

  //trigger events
  virtual task do_events_trigger();
    uvm_object tmp;
    uvm_reg r;
    fork
      forever begin
        fork
          wdg_regacc_fd_e.wait_trigger_data(tmp);
          wdg_regacc_bd_e.wait_trigger_data(tmp);
        join_any
        disable fork;
        void'($cast(r, tmp));
        // ensure RGM mirror value has been updated by monitor transaction, so
        // subscriber can get update value
        #1ps;
        wdg_regacc_e.trigger(r);
        if(r.get_name() == "WDOGCONTROL") begin
          if(rgm.WDOGCONTROL.INTEN.get() == 1'b1) wdg_inten_e.trigger();
          if(rgm.WDOGCONTROL.RESEN.get() == 1'b1) wdg_resen_e.trigger();
        end
        else if(r.get_name() == "WDOGLOAD") begin
          if(rgm.WDOGLOAD.LOADVAL.get() != 1'b0) wdg_load_e.trigger();
        end
        else if(r.get_name() == "WDOGINTCLR") begin
          if(rgm.WDOGINTCLR.INTCLR.get() == 1'b1) wdg_intrclr_e.trigger();
        end
      end
      forever begin
        @(posedge vif.wdg_clk) -> wdg_posedge_clk;
      end
    join_none
  endtask

  virtual task do_listen_events();
  endtask
  
endclass


`endif//RKV_WATCHDOG_SUBSCRIBER_SV

