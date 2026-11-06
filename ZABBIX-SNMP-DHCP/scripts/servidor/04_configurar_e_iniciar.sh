#!/bin/bash
# ZABBIX-1325 - Importar esquema, configurar la conexion a la BD e iniciar servicios
# Ejecutar como root.

# Importar el esquema (pide la contrasena Zabbix#1325)
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | \
  mysql --default-character-set=utf8mb4 -uOmarpaulino -p zabbix
mysql -e "set global log_bin_trust_function_creators = 0;"

# Usuario y contrasena de la base de datos en el servidor Zabbix
sed -i 's/^DBUser=.*/DBUser=Omarpaulino/' /etc/zabbix/zabbix_server.conf
sed -i 's/^# DBPassword=.*/DBPassword=Zabbix#1325/' /etc/zabbix/zabbix_server.conf
grep -E "^DB" /etc/zabbix/zabbix_server.conf
zabbix_server -c /etc/zabbix/zabbix_server.conf -T

# Servicios
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2
systemctl status zabbix-server --no-pager
