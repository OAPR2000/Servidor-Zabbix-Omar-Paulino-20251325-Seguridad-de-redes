#!/bin/bash
# ZABBIX-1325 - Pruebas SNMP contra el router y el switch
snmpwalk -v2c -c ZBX1325-RO 10.13.25.1 1.3.6.1.2.1.1
snmpwalk -v2c -c ZBX1325-RO 10.13.25.2 1.3.6.1.2.1.1 | head -n 10
# Debe fallar con "noAccess": la comunidad es de solo lectura
snmpset -v2c -c ZBX1325-RO 10.13.25.1 1.3.6.1.2.1.1.5.0 s PRUEBA
