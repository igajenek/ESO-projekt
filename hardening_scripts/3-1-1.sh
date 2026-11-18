#!/usr/bin/env bash

sysctl -w net.ipv6.conf.all.disable_ipv6=0
sysctl -w net.ipv6.conf.default.disable_ipv6=0

CONFIG_FILE="/etc/sysctl.d/65-enable-ipv6.conf"
echo "net.ipv6.conf.all.disable_ipv6 = 0" > "$CONFIG_FILE"
echo "net.ipv6.conf.default.disable_ipv6 = 0" >> "$CONFIG_FILE"

sysctl --system > /dev/null 2>&1