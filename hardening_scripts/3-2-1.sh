#!/bin/bash
[ "$EUID" -ne 0 ] && exit 1
modprobe -r atm 2>/dev/null
rmmod can 2>/dev/null
CONFIG_FILE="/etc/modprobe.d/60-atm.conf"
grep -q "install atm /bin/false" "$CONFIG_FILE" 2>/dev/null || printf '\n%s\n' "install atm /bin/false" >> "$CONFIG_FILE"
grep -q "blacklist atm" "$CONFIG_FILE" 2>/dev/null || printf '\n%s\n' "blacklist atm" >> "$CONFIG_FILE"