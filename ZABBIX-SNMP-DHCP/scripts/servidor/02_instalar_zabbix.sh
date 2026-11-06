#!/bin/bash
# ZABBIX-1325 - Instalacion de Zabbix 7.0 LTS con MySQL y Apache
# Ejecutar como root (sudo -i), un bloque a la vez.

# 1. Repositorio de Zabbix
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.0+ubuntu24.04_all.deb
dpkg -i zabbix-release_latest_7.0+ubuntu24.04_all.deb
apt update

# 2. Paquetes
apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf \
  zabbix-sql-scripts zabbix-agent mysql-server snmp
dpkg -l | grep zabbix
