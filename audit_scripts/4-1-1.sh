#!/usr/bin/env bash
{
 dpkg-query -s ufw &>/dev/null && echo "ufw is installed"
}
