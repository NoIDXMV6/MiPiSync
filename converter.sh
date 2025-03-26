#!/bin/bash
# Converter.sh by NoID 

# With this script, you can convert domain lists from Pi-Hole 5.x to MikroTik-Static-DNS-Syncronizer.
# Usage: ./converter.sh [domain-list-file] [output-file]

echo -e "[+] Converter.sh by NoID"
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Convert stanart Pi-Hole Local DNS List to config.ini format MikroTik-Static-DNS-Syncronizer."
    echo "Source code https://github.com/netspeedy/MikroTik-Static-DNS-Synchronizer"
    echo ""
    echo "[!] File config.head must be exist and contains creditionals data like this:"
    echo ""
    echo ""
    echo "------------------- CUT ------------------"
    echo "[Router]"
    echo "address = 192.168.1.1"
    echo "username = autodns"
    echo "password = dnssync"
    echo ""
    echo "[DNSRecords]"
    echo "------------------- CUT ------------------"
    echo ""
    echo ""
    echo "[!] Usage: ./converter.sh [domain-list-file] [output-file]"
  exit 1
fi

echo -e "\n[+] Converting from customlist to config.ini..."
cp config.head $2
awk '{print $2,"=",$1}' $1 >> $2
echo -e "\n[+] Done, DNS with IPs saved to '$2'."
