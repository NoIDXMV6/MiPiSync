#!/bin/bash

cd /opt/MiPiSync
/bin/bash converter.sh /etc/pihole/custom.list config.ini
/usr/bin/python3 mikrotik_dns_sync.py
exit
