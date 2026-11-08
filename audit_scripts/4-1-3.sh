#!/usr/bin/env bash
{
 ufw status verbose | awk -F',' '$1~/Default/ {print $1}'
}
