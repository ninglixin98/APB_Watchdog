#############################
# User variables
#############################
TB       = rkv_watchdog_tb
SEED     = 1
GUI      ?= 0
DOTCL    ?= 1
TESTNAME ?= rkv_watchdog_integration_test
DFILES   = ../../verilog/{cmsdk_apb_watchdog.v,cmsdk_apb_watchdog_frc.v}
VFILES  += ../vip_lib/apb_pkg/apb_if.sv \
           ../vip_lib/apb_pkg/apb_pkg.sv \
					 ../env/rkv_watchdog_pkg.sv \
           ../tb/rkv_watchdog_tb.sv \
					 ../tb/rkv_watchdog_if.sv


#############################
# Environment variables
#############################
VCOMP_INC = +incdir+../../verilog \
            +incdir+../vip_lib/apb_pkg \
						+incdir+../{cfg,cov,env,reg,seq_lib,test}
VCOMP    = vlogan -full64 -ntb_opts uvm-1.2 -sverilog -timescale=1ps/1ps -nc -l comp.log $(VCOMP_INC)
ELAB     = vcs -full64 -ntb_opts uvm-1.2 -debug_acc+all -l elab.log -sim_res=1ps 
RUN      = ./$(TB).simv -l run.log -sml +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(TESTNAME)
SIMRUNFILE  = rkv_watchdog_sim_run.do
ifeq ($(GUI),1)
RUN += -gui 
endif
ifeq ($(DOTCL),1)
RUN += -ucli -do $(SIMRUNFILE) 
endif


comp:
	$(VCOMP) 
	$(VCOMP) $(DFILES) $(VFILES)

elab: comp
	$(ELAB) -top $(TB) -o $(TB).simv

run:
	$(RUN) 

rung:
	$(RUN) -gui

clean:
	rm -rf AN.DB DVEfiles csrc *.simv *.simv.daidir *.simv.vdb ucli.key
	rm -rf *.log* *.vpd *.h urgReport

