#!/usr/bin/env bash
{
 output=$(ufw status verbose)

 result=$(echo "$output" | awk -F',' '$1~/Default/ {print $1}')

 echo "$result"

if echo "$output" | grep -qE "deny.*\(incoming\)|\(incoming\).*deny"; then
    exit 0
else
    exit 2
fi
}