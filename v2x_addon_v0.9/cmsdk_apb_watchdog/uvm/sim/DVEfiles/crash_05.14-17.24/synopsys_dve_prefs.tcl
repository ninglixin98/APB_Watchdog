# DVE version O-2018.09-SP2_Full64
# Preferences written on Sat May 7 20:23:54 2022
gui_set_var -name {read_pref_file} -value {true}
gui_set_pref_value -category {Globals} -key {app_default_font} -value {Courier 10 Pitch,16,-1,5,50,0,0,0,0,0}
gui_set_pref_value -category {Globals} -key {app_fixed_width_font} -value {Courier 10 Pitch,18,-1,5,50,0,0,0,0,0}
gui_set_pref_value -category {Globals} -key {cbug_fifo_dump_enable_proc} -value {false}
gui_create_pref_key -category {Globals} -key {load_detail_for_funcov} -value_type {bool} -value {false}

gui_create_pref_category -category {dlg_settings}
gui_create_pref_key -category {dlg_settings} -key {tableWithImmediatePopup} -value_type {bool} -value {true}
gui_set_var -name {read_pref_file} -value {false}
