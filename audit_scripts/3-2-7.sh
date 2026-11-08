#!/usr/bin/env bash

UNNEEDED_MODULES=("appletalk" "ax25" "netrom" "x25" "rose")

for l_mod_name in "${UNNEEDED_MODULES[@]}"; do
    echo -e "\n Moduł: $l_mod_name "
    l_mod_type="net"
 while IFS= read -r l_mod_path; do
 if [ -d "$l_mod_path/${l_mod_name//-/\/}" ] && \
 [ -n "$(ls -A "$l_mod_path/${l_mod_name//-/\/}")" ]; then
 printf '%s\n' "$l_mod_name exists in $l_mod_path"
 fi
 done < <(readlink -e /usr/lib/modules/**/kernel/$l_mod_type \
 || readlink -e /lib/modules/**/kernel/$l_mod_type)
 
 lsmod | grep "^$l_mod_name\b"
 
 modprobe --showconfig | grep -P -- "\b(install|blacklist)\h+$l_mod_name\b"
done