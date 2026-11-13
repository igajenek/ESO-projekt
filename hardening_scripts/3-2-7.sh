#!/bin/bash
[ "$EUID" -ne 0 ] && exit 1
MODULES=("appletalk" "ax25" "netrom" "x25" "rose")

for MODULE in "${MODULES[@]}"; do
    modprobe -r "$MODULE" 2>/dev/null
    CONFIG_FILE="/etc/modprobe.d/60-${MODULE}.conf"
    grep -q "install $MODULE /bin/false" "$CONFIG_FILE" 2>/dev/null || printf '\n%s\n' "install $MODULE /bin/false" >> "$CONFIG_FILE"
    grep -q "blacklist $MODULE" "$CONFIG_FILE" 2>/dev/null || printf '\n%s\n' "blacklist $MODULE" >> "$CONFIG_FILE"
done
