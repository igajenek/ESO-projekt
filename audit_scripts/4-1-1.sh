#!/usr/bin/env bash
{
if dpkg-query -s ufw &>/dev/null; then
    echo "Pakiet ufw jest zainstalowany"
    exit 0
else
    echo "Pakiet ufw NIE jest zainstalowany"
    exit 1
fi
}