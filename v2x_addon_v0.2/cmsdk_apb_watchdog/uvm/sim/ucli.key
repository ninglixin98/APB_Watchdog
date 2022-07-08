# GUI mode or Batch mode execution branch for different purpose
if {[info command guiIsActive]==""} {
  run
} else { 
  echo "GUI mode"
  dump -add / -depth 0
  do ./rkv_watchdog_debug_wave.do
}
