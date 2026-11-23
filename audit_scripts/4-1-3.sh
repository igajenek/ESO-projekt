#!/usr/bin/env bash
{
 output=$(ufw status verbose)

 result=$(echo "$output" | awk -F',' '$1~/Default/ {print $1}')

 echo "$result"

 if echo "$result" | grep -qE "Default:.*incoming \((deny|reject)\)"; then
     exit 0
 elif echo "$result" | grep -q "Default:"; then
     exit 2
 else
     exit 1
 fi
}