#!/bin/bash

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
# sudo mysql
# CREATE DATABASE ecomdb;
# CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
# GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
# FLUSH PRIVILEGES;

cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");

EOF

mysql < db-load-script.sql