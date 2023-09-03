#!/bin/bash

: '
function print_color "green"(){
    GREEN="\032[4;32m"
    NC="\033[0m"

    echo -e "${GREEN} $1 ${NC}"
}
# Similar function above, refactor
function print_red(){
    GREEN="\032[4;31m"
    NC="\033[0m"

    echo -e "${RED} $1 ${NC}"
}
'

function print_color(){
    # if [ $1 == "green" ]
    # then
    #     COLOR="\033[4;32m"
    # fi

    NC="\033[0m"

    case $1 in
        "green") COLOR="\033[4;32m" ;;
        "red") COLOR="\033[4;31m" ;;
        "*") COLOR="\033[4;33m" ;;
    esac

    echo -e "${COLOR} $2 ${NC}"
}

function check_service_status(){
    print_color "green" "check service status"

    is_service_active=$(systemctl is-active $1)

    if [ is_service_active = "active" ]
    then
        print_color "green" "$1 is active"
    else
        print_color "red" "$1 is not active"
        exit 1
    fi
}

function is_firewalld_rule_configured(){
    firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)
    if [[ firewalld_ports = *$1* ]]
    then
        print_color "green" "Port $1 configured"
    else
        print_color "red" "Port $1 not configured"
    fi
}

function check_item(){

}

# --------------------------------------------------------------------------------

echo -e "\033[4;33m---------------- Setup Database Server ------------------\033[0m"

# echo -e "\033[4;32minstall firewalld...\033[0m"
print_color "green" "install firewalld..."

sudo yum install -y firewalld

print_color "green" "start firewalld"
sudo service firewalld start

print_color "green" "enable firewalld"
sudo systemctl enable firewalld

check_service_status firewalld
# print_color "green" "check firewalld status"
# is_firewalld_active=$(systemctl is-active firewalld)

# if [ is_firewalld_active = "active" ]
# then
#     print_color "green" "Firewalld Service is active"
# else
#     print_color "red" "Firewalld Service is not active"
#     exit 1
# fi

print_color "green" "install maria db"
sudo yum install -y mariadb-server

print_color "green" "start maria db"
sudo service mariadb start

print_color "green" "enable maraiadb"
sudo systemctl enable mariadb


check_service_status mariadb
# print_color "green" "check mariadb status"
# is_mariadb_active=$(systemctl is-active mariadb)

# if [ is_mariadb_active = "active" ]
# then
#     print_color "green" "mariadb Service is active"
# else
#     print_color "red" "mariadb Service is not active"
#     # exit 1
# fi

print_color "green" "add firewall rule"
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

print_color "green" "check firewalld 3306 port"
is_firewalld_rule_configured 3306
# firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)
# if [[ firewalld_ports = *3306* ]]
# then
#     print_color "green" "Port 3306 configured"
# else
#     print_color "red" "Port 3306 not configured"
# fi


print_color "green" "Setting up Database..."
cat > setup-db.sql <<-EOF
    CREATE DATABASE ecomdb;
    CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
    GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
    FLUSH PRIVILEGES;
EOF

print_color "green" "use mysql cli setup database"
sudo mysql < setup-db.sql

print_color "green" "Create table-script.sql ..."
cat > table-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
EOF

sudo mysql < table-script.sql

mysql_db_results=$(sudo mysql -e "use ecomdb; select * from products;")
if [[ $mysql_db_results = *Laptop* ]]
then
    print_color "green" "Inventory data loaded"
else
    print_color "red" "Inventory data not loaded"
fi

echo -e "\033[4;33m----------------- Setup Web Server --------------------\033[0m"
print_color "green" "Installing Web Server Packages ..."
sudo yum install -y httpd php php-mysql

print_color "green" "Configuring FirewallD rules.."
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

print_color "green" "check firewalld 80 port"
is_firewalld_rule_configured 80

# Update index.php
print_color "green" "Replace index.html with index.php"
sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf

# Start httpd service
print_color "green" "Start httpd service.."
sudo service httpd start
sudo systemctl enable httpd

check_service_status httpd

# Download code
print_color "green" "Install GIT.."
sudo yum install -y git

print_color "green" "Updating index.php.."
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php

print_color "green" "Setting up completed......"

print_color "green" "---------------- Setup Web Server - Finished ------------------"

# Test Script
web_page=$(curl http://localhost)

for item in Laptop Drone VR Watch Phone
do
  check_item "$web_page" $item
done