gui_exclusion -set_force true
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
gui_open_cov  -hier out/cov.vdb -testdir {} -test {out/cov/rkv_watchdog_countdown_test_100 out/cov/rkv_watchdog_countdown_test_101 out/cov/rkv_watchdog_countdown_test_102 out/cov/rkv_watchdog_countdown_test_105 out/cov/rkv_watchdog_countdown_test_110 out/cov/rkv_watchdog_countdown_test_107 out/cov/rkv_watchdog_countdown_test_108 out/cov/rkv_watchdog_countdown_test_109 out/cov/rkv_watchdog_countdown_test_15} -merge MergedTest -db_max_tests 10 -fsm transition
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t2_load_reload_cg
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t2_load_reload_cg
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg
verdiDockWidgetUndock -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg  /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}
gui_list_expand -id CoverageTable.1   /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}.INTEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}.INTEN  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}.INTEN  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}.RESEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}.RESEN  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{2273537903}.RESEN  /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}
gui_list_expand -id CoverageTable.1   /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}.INTEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}.INTEN  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}.INTEN  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}.RESEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}.RESEN  -column {Group} 
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_cg::CHECK_SUM{3295603058}.RESEN  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.INTEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.INTEN  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.INTEN  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.RESEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.RESEN  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.RESEN  rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.INTEN   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t1_overall_control_clk_cg.INTEN  -column {Group} 
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t2_load_reload_cg/rkv_watchdog_pkg::rkv_watchdog_cov::rkv_wdg_t2_load_reload_cg::CHECK_SUM{4284487787}
verdiDockWidgetHide -dock widgetDock_<Summary>
gui_set_pref_value -category {ColumnCfg} -key {covtblFGroupsList_V1.1_Group_width} -value {562}
vdCovExit -noprompt
