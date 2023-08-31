#!/bin/bash


echo "---------------- Setup Database Server ------------------"
# install firewalld
sudo yum install -y firewalld

# start firewalld
sudo service firewalld start

# enable firewalld
sudo systemctl enable firewalld

# install maria db
sudo yum install -y mariadb-server

# start maria db
sudo service mariadb start

# enable maraiadb
sudo systemctl enable mariadb

# add firewall rule
# sudo firewall-cmd --list-all
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

# Configure Database
echo "Setting up Database..."
cat > setup-db.sql <<-EOF
    CREATE DATABASE ecomdb;
    CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
    GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
    FLUSH PRIVILEGES;
EOF

echo "use mysql cli setup database"
sudo mysql < setup-db.sql

echo "Create table-script.sql ..."
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
EOF

sudo mysql < db-load-script.sql


echo "---------------- Setup Web Server ------------------"

# Install web server
echo "Installing Web Server Packages ..."
sudo yum install -y httpd php php-mysql

# Configure firewalld rules
echo "Configuring FirewallD rules.."
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

# Update index.php
echo "Replace index.html with index.php"
sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf

# Start httpd service
echo "Start httpd service.."
sudo service httpd start
sudo systemctl enable httpd

# Download code
echo "Install GIT.."
sudo yum install -y git
echo "Updating index.php.."
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php