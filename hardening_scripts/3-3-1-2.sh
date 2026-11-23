#!/usr/bin/env bash
{
 l_option="net.ipv4.conf.all.forwarding" l_value="0"
 l_grep="${l_option//./(\\.|\\/)}" a_files=()
 l_systemdsysctl="$(readlink -e /lib/systemd/systemd-sysctl \
 || readlink -e /usr/lib/systemd/systemd-sysctl)"
 l_ufw_file="$([ -f /etc/default/ufw ] && \
 awk -F= '/^\s*IPT_SYSCTL=/ {print $2}' /etc/default/ufw)"
 [ -f "$(readlink -e "$l_ufw_file")" ] && \
 a_files+=("$l_ufw_file"); a_files+=("/etc/sysctl.conf")
 while IFS= read -r l_fname; do
 l_file="$(readlink -e "${l_fname//# /}")"
 [ -n "$l_file" ] && ! grep -Psiq -- '(^|\h+)'"$l_file"'\b' \
 <<< "${a_files[*]}" && a_files+=("$l_file")
 done < <("$l_systemdsysctl" --cat-config | tac | \
 grep -Psio -- '^\h*#\h*\/[^#\n\r\h]+\.conf\b')
 for l_file in "${a_files[@]}"; do
 grep -Psio -- '\h*'"$l_grep"'\h*=\h*\H+\b' "$l_file" \
 | grep -Psivq -- '^\h*'"$l_grep"'\h*=\h*'"$l_value"'\b' && \
 sed -ri '/^\s*'"$l_grep"'\s*=\s*(s[0-9]*)/s/^/# /' "$l_file"
 done
 
[ ! -d "/etc/sysctl.d/" ] && mkdir -p /etc/sysctl.d/
printf '%s\n' "" "net.ipv4.conf.all.forwarding = 0" >> /etc/sysctl.d/60-ipv4_sysctl.conf

sysctl --system
}
