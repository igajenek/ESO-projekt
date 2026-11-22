#!/usr/bin/env bash
{
systemctl is-enabled ufw.service &>/dev/null
enabled=$?

systemctl is-active ufw.service &>/dev/null
active=$?

ufw status

if [ $enabled -eq 0 ] && [ $active -eq 0 ]; then
    exit 0
elif [ $enabled -eq 0 ] || [ $active -eq 0 ]; then
    exit 2
else
    exit 1
fi
}
