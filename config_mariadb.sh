#!/bin/bash

# Install MariaDB Server
echo "Installing MariaDB Server..."
apt-get install -y mariadb-server

# Secure MariaDB installation
echo "Securing MariaDB installation..."
mysql_secure_installation << EOF

y
password
password
y
y
y
y
EOF

# Modify MariaDB configuration file
echo "Modifying MariaDB configuration file..."
sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Restart MariaDB service
echo "Restarting MariaDB service..."
systemctl restart mariadb

echo "MariaDB Server configuration complete!"
