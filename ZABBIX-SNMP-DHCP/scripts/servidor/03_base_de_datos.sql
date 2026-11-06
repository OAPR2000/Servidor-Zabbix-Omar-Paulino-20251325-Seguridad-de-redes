-- ZABBIX-1325 - Base de datos de Zabbix (ejecutar dentro de: mysql)
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user Omarpaulino@localhost identified by 'Zabbix#1325';
grant all privileges on zabbix.* to Omarpaulino@localhost;
set global log_bin_trust_function_creators = 1;
quit;
