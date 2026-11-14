#!/usr/bin/env bash
{
 l_mod_name="can" l_mod_type="net"
 l_files_found=0
 while IFS= read -r l_mod_path; do
	 if [ -d "$l_mod_path/${l_mod_name//-/\/}" ] && \
	 [ -n "$(ls -A "$l_mod_path/${l_mod_name//-/\/}")" ]; then
	 printf '%s\n' "$l_mod_name exists in $l_mod_path"
	 l_files_found=1
	 fi
 done < <(readlink -e /usr/lib/modules/**/kernel/$l_mod_type \
 || readlink -e /lib/modules/**/kernel/$l_mod_type)
 
 l_is_loaded=0
if lsmod | grep -q "^$l_mod_name\b"; then
    echo "Moduł $l_mod_name jest załadowany"
    l_is_loaded=1
fi
 
 l_is_blacklisted=0
if modprobe --showconfig | grep -P -q -- "\b(install|blacklist)\h+$l_mod_name\b"; then
    l_is_blacklisted=1
fi

if [ "$l_is_loaded" -eq 1 ]; then
    exit 1
fi
if [ "$l_files_found" -eq 0 ]; then
    exit 0
fi
if [ "$l_files_found" -eq 1 ] && [ "$l_is_blacklisted" -eq 1 ]; then
    exit 0
fi
if [ "$l_files_found" -eq 1 ] && [ "$l_is_blacklisted" -eq 0 ]; then
    exit 2
fi
exit 1
}