gui_exclusion -set_force true
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
verdiDockWidgetUndock -dock widgetDock_<Summary>
gui_open_cov  -hier out/cov.vdb -testdir {} -test {out/cov/rkv_watchdog_countdown_test_100 out/cov/rkv_watchdog_countdown_test_1 out/cov/rkv_watchdog_resen_test_1 out/cov/rkv_watchdog_countdown_disable_test_1 out/cov/rkv_watchdog_integration_test_1 out/cov/rkv_watchdog_lock_test_1 out/cov/rkv_watchdog_regacc_test_1 out/cov/rkv_watchdog_illegal_apbacc_test_1 out/cov/rkv_watchdog_reload_test_1} -merge MergedTest -db_max_tests 10 -fsm transition
gui_covdetail_select -id  CovDetail.1   -name   Toggle
gui_covdetail_select -id  CovDetail.1   -name   Line
gui_close_db -file out/cov.vdb -design Cov
gui_open_cov  -hier out/cov.vdb -testdir  {out/cov.vdb} -test { out/cov/rkv_watchdog_countdown_disable_test_1 out/cov/rkv_watchdog_countdown_test_1 out/cov/rkv_watchdog_countdown_test_100 out/cov/rkv_watchdog_illegal_apbacc_test_1 out/cov/rkv_watchdog_integration_test_1 out/cov/rkv_watchdog_lock_test_1 out/cov/rkv_watchdog_regacc_test_1 out/cov/rkv_watchdog_reload_test_1 out/cov/rkv_watchdog_resen_test_1 } -merge MergedTest -db_max_tests 10 -fsm transition
gui_covdetail_select -id  CovDetail.1   -name   FSM
gui_covdetail_select -id  CovDetail.1   -name   Condition
gui_covdetail_select -id  CovDetail.1   -name   Toggle
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiDockWidgetSetCurTab -dock widgetDock_<Hvp>
verdiDockWidgetSetCurTab -dock widgetDock_<CovSrc.1>
gui_covdetail_select -id  CovDetail.1   -name   Condition
gui_src_cov_navigation_set_criteria -id CovSrc.1 -category Any
gui_src_cov_navigation_set_criteria -id CovSrc.1 -category Uncovered
vdCovExit -noprompt
