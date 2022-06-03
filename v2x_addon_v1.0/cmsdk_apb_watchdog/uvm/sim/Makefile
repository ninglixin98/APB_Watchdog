#############################
# User variables
#############################
TB       = rkv_watchdog_tb
SEED     = 1
GUI      ?= 0
COV      ?= 0
DOTCL    ?= 1
OUT      ?= out
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
						+incdir+../{cfg,cov,env,reg,seq_lib,seq_lib/elem_seqs,test}
VCOMP    = vlogan -full64 -ntb_opts uvm-1.2 -sverilog -timescale=1ps/1ps -nc -l $(OUT)/log/comp.log $(VCOMP_INC)
ELAB     = vcs -full64 -ntb_opts uvm-1.2 -debug_acc+all -l $(OUT)/log/elab.log -sim_res=1ps 
RUN      = $(OUT)/obj/$(TB).simv -l run.log -sml +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(TESTNAME) -cm_dir $(CM_DIR) -cm_name $(CM_NAME)
COV_OPTS = -full64 -dir $(CM_DIR)
CM_DIR  ?= $(OUT)/cov.vdb
CM_NAME ?= $(TESTNAME)_$(SEED)
SIMRUNFILE  = rkv_watchdog_sim_run.do
ifeq ($(GUI),1)
RUN += -gui 
endif
ifeq ($(DOTCL),1)
RUN += -ucli -do $(SIMRUNFILE) 
endif
ifeq ($(COV), 1)
	ELAB += -cm line+cond+fsm+tgl+branch+assert -cm_dir $(CM_DIR)
	RUN += -cm line+cond+fsm+tgl+branch+assert -covg_cont_on_error
endif

prepare:
	mkdir -p $(OUT)/work
	mkdir -p $(OUT)/log
	mkdir -p $(OUT)/sim
	mkdir -p $(OUT)/obj
	
comp: prepare
	$(VCOMP) 
	$(VCOMP) $(DFILES) $(VFILES)

elab: comp
	$(ELAB) -top $(TB) -o $(OUT)/obj/$(TB).simv

run:
	$(RUN) 

rung:
	$(RUN) -gui

mergecov:
	urg -format both $(COV_OPTS)

dvecov:
	dve $(COV_OPTS)

verdicov:
	verdi -cov -covdir $(CM_DIR)

htmlcov:
	firefox urgReport/dashboard.html

clean:
	rm -rf $(OUT) AN.DB DVEfiles csrc *.simv *.simv.daidir *.simv.vdb ucli.key
	rm -rf *.log* *.vpd *.h urgReport

