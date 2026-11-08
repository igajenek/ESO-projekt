#!/usr/bin/env bash
{
 ufw status verbose | awk '/^Default:/{print}' | grep -w routed
}
