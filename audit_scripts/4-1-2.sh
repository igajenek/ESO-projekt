#!/usr/bin/env bash
{
 systemctl is-enabled ufw.service
 
 systemctl is-active ufw.service
 
 ufw status
}
