# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Tue May 10 11:40:43 2022
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 16 signals
# End_DVE_Session_Save_Info

# DVE version: O-2018.09-SP2_Full64
# DVE build date: Feb 28 2019 23:39:41


#<Session mode="View" path="/home/verifier/project/rkv_labs/v2x_addon/cmsdk_apb_watchdog/uvm/sim/rkv_watchdog_debug_wave.do" type="Debug">

#<Database>

gui_set_time_units 1ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Tue May 10 11:40:43 2022
# 16 signals
# End_DVE_Session_Save_Info

# DVE version: O-2018.09-SP2_Full64
# DVE build date: Feb 28 2019 23:39:41


#Add ncecessay scopes

gui_set_time_units 1ps

set _wave_session_group_1 Group1
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:rkv_watchdog_tb.dut.PCLK} {Sim:rkv_watchdog_tb.dut.PRESETn} {Sim:rkv_watchdog_tb.dut.PENABLE} {Sim:rkv_watchdog_tb.dut.PSEL} {Sim:rkv_watchdog_tb.apb_if_inst.paddr} {Sim:rkv_watchdog_tb.dut.PWRITE} {Sim:rkv_watchdog_tb.dut.PWDATA} {Sim:rkv_watchdog_tb.dut.PRDATA} {Sim:rkv_watchdog_tb.dut.PADDR} }

set _wave_session_group_2 Group2
if {[gui_sg_is_group -name "$_wave_session_group_2"]} {
    set _wave_session_group_2 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_2"

gui_sg_addsignal -group "$_wave_session_group_2" { {Sim:rkv_watchdog_tb.dut.WDOGCLK} {Sim:rkv_watchdog_tb.dut.WDOGCLKEN} {Sim:rkv_watchdog_tb.dut.WDOGRESn} {Sim:rkv_watchdog_tb.dut.WDOGINT} {Sim:rkv_watchdog_tb.dut.WDOGRES} {Sim:rkv_watchdog_tb.dut.ECOREVNUM} }

set _wave_session_group_3 Group4
if {[gui_sg_is_group -name "$_wave_session_group_3"]} {
    set _wave_session_group_3 [gui_sg_generate_new_name]
}
set Group3 "$_wave_session_group_3"

gui_sg_addsignal -group "$_wave_session_group_3" { {Sim:rkv_watchdog_tb.dut.u_apb_watchdog_frc.reg_count} }
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 10000
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group3}]
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group3}  -position in

gui_marker_move -id ${Wave.1} {C1} 1999837
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

