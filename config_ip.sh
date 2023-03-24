#!/bin/bash

# konfigurasi interface network
echo "Konfigurasi interface network..."
cat << EOF >/etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
EOF

# restart service network
echo "Restarting service network..."
/etc/init.d/networking restart

echo "Konfigurasi IP selesai"
