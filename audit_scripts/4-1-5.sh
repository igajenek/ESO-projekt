#!/usr/bin/env bash
{
 output=$(ufw status verbose | awk '/^Default:/{print}' | grep -w routed)

 echo "$output"

 if [ -n "$output" ]; then
     if echo "$output" | grep -qE "(disabled|drop|reject|deny) \(routed\)"; then
         exit 0
     else
         exit 2
     fi
 else
     exit 1
 fi
}