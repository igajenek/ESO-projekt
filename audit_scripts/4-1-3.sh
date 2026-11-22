#!/usr/bin/env bash
{
output=$(ufw status verbose)

echo "$output" | awk -F',' '$1~/Default/ {print $1}'

if echo "$output" | grep -qE "Default:.*incoming \((deny|reject)\)"; then
    exit 0
elif echo "$output" | grep -q "Default:"; then
    exit 2
else
    exit 1
fi
}
