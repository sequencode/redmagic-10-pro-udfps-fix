#!/system/bin/sh
# Set virtual_sensors_are_real early so the framework fingerprint path is active from boot.
RP=/data/adb/ap/bin/resetprop
[ -x "$RP" ] || RP=resetprop
$RP -n -p persist.sys.phh.virtual_sensors_are_real 1 2>/dev/null
