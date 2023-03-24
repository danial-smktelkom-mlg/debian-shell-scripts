#!/bin/bash

# Install BIND9
echo "Installing BIND9..."
apt-get install -y bind9 bind9utils bind9-doc

# Backup named.conf.options and named.conf.local files
echo "Backing up named.conf.options and named.conf.local files..."
cp /etc/bind/named.conf.options /etc/bind/named.conf.options.bak
cp /etc/bind/named.conf.local /etc/bind/named.conf.local.bak

# Modify named.conf.options and named.conf.local files
echo "Modifying named.conf.options and named.conf.local files..."
sed -i 's/127.0.0.1;/any;/' /etc/bind/named.conf.options
echo 'zone "example.com" {' >> /etc/bind/named.conf.local
echo '    type master;' >> /etc/bind/named.conf.local
echo '    file "/etc/bind/db.example.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
cp /etc/bind/db.local /etc/bind/db.example.com
sed -i 's/localhost./example.com./' /etc/bind/db.example.com

# Restart BIND9 service
echo "Restarting BIND9 service..."
systemctl restart bind9

echo "BIND9 configuration complete!"
