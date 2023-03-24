#!/bin/bash

# Install SSH server
echo "Installing SSH server..."
apt-get install -y openssh-server

# Backup sshd_config file
echo "Backing up sshd_config file..."
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Modify sshd_config file
echo "Modifying sshd_config file..."
sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Restart SSH service
echo "Restarting SSH service..."
systemctl restart ssh

echo "SSH configuration complete!"
