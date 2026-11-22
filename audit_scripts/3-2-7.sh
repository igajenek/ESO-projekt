#!/usr/bin/env bash

UNNEEDED_MODULES=("appletalk" "ax25" "netrom" "x25" "rose")
l_global_status=0

for l_mod_name in "${UNNEEDED_MODULES[@]}"; do
    l_mod_type="net"
    
    l_files_found=0
    while IFS= read -r l_mod_path; do
        if [ -d "$l_mod_path/${l_mod_name//-/\/}" ] && \
           [ -n "$(ls -A "$l_mod_path/${l_mod_name//-/\/}")" ]; then
            l_files_found=1
        fi
    done < <(readlink -e /usr/lib/modules/**/kernel/$l_mod_type \
          || readlink -e /lib/modules/**/kernel/$l_mod_type)
    
    l_is_loaded=0
    if lsmod | grep -q "^$l_mod_name\b"; then
        l_is_loaded=1
    fi
    
    l_is_blacklisted=0
    if modprobe --showconfig | grep -P -q -- "\b(install|blacklist)\h+$l_mod_name\b"; then
        l_is_blacklisted=1
    fi
    
    if [ "$l_is_loaded" -eq 1 ]; then
        [ "$l_global_status" -lt 1 ] && l_global_status=1
    elif [ "$l_files_found" -eq 1 ] && [ "$l_is_blacklisted" -eq 0 ]; then
        l_global_status=2
    fi
done

if [ "$l_global_status" -eq 0 ]; then
    exit 0
elif [ "$l_global_status" -eq 2 ]; then
    exit 2
else
    exit 1
fi