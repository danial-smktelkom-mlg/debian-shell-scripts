#!/bin/bash

# Install Apache2
echo "Installing Apache2..."
apt-get install -y apache2

# Backup Apache2 config files
echo "Backing up Apache2 config files..."
cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak
cp /etc/apache2/ports.conf /etc/apache2/ports.conf.bak

# Modify Apache2 config files
echo "Modifying Apache2 config files..."
sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Restart Apache2 service
echo "Restarting Apache2 service..."
systemctl restart apache2

echo "Apache2 configuration complete!"
