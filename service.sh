#!/system/bin/sh
MODDIR=${0%/*}
LOG=/data/local/tmp/redmagic_udfps.log
echo "[udfps] service start $(date)" > "$LOG"

while [ "$(getprop sys.boot_completed)" != "1" ]; do sleep 2; done
sleep 5

# Copy the daemon DEX to a writable location so app_process can load it.
cp "$MODDIR/bin/ZteFodDaemon.dex" /data/local/tmp/ZteFodDaemon.dex 2>> "$LOG"
chmod 644 /data/local/tmp/ZteFodDaemon.dex 2>> "$LOG"

# Watchdog: start the daemon and restart it if it ever dies.
while true; do
    if ! pgrep -f ZteFodDaemon > /dev/null 2>&1; then
        echo "[udfps] (re)starting daemon $(date)" >> "$LOG"
        CLASSPATH=/data/local/tmp/ZteFodDaemon.dex setsid app_process /system/bin ZteFodDaemon >> "$LOG" 2>&1
    fi
    sleep 10
done
