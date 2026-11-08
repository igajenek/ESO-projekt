#!/usr/bin/env bash
{
 sysctl net.ipv4.conf.default.log_martians
 
 l_parameter_name="net.ipv4.conf.default.log_martians"
 l_grep="${l_parameter_name//./(\\.|\\/)}" a_output=() a_files=()
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
 l_opt="$(grep -Psio '^\h*'"$l_grep"'\h*=\h*\H+\b' "$l_file" | tail -n 1)"
 l_option_value="$(cut -d= -f2 <<< "$l_opt" | xargs)"
 [ -n "$l_option_value" ] && \
 a_output+=(" - \"$l_parameter_name = $l_option_value\" is set in: \"$l_file\"")
 done
 [ "${#a_output[@]}" -gt "0" ] && printf '%s\n' "" "${a_output[@]}" ""
}
