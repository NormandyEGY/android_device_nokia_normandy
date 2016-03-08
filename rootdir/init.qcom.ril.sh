#!/system/bin/sh

# by dianlujitao
setprop rild.libpath "/system/lib/libril-qc-qmi-1.so"
stop ril-daemon
start ril-daemon
