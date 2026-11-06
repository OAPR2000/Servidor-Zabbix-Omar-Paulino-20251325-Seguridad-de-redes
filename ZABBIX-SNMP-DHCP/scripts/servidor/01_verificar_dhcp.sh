#!/bin/bash
# ZABBIX-1325 (Ubuntu Cloud Guest 24.04) - Verificar que la IP llega por DHCP
sudo hostnamectl set-hostname zabbix-1325
ip -4 a show ens3            # debe decir "dynamic"
ip route                     # default via 10.13.25.1 proto dhcp
resolvectl status | grep "DNS Servers"
cat /etc/netplan/*.yaml      # dhcp4: true
ping -c 4 10.13.25.1
ping -c 4 google.com
sudo timedatectl set-timezone America/Santo_Domingo
sudo apt update && sudo apt upgrade -y
