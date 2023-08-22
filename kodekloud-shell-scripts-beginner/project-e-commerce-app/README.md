# LAMP
- Linux (CentOS)
  - Install Firewall
```bash
sudo yum install firewalld

sudo service firewall start

sudo systemctl enable firewalld
```
- MariaDB
  - Install & Configure 
    - MariaDB
    - Firewall
    - Database
```bash
sudo yum install mariadb-server

sudo vi /etc/my.cnf # configure the file with the right port

sudo service mariadb start

sudo syystemctl enable mariadb

sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp

sudo firewall-cmd --reload

mysql
MariaDB > CREATE DATABASE ecomdb;
MariaDB > GRANTE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword'
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
MariaDB > FLUSH PRIVILEGES;

mysql < db-load-script.sql
```
- Apache、php
  - Install & Configure
    - httpd
    - Firewall
```bash
sudo yum install -y http php php-mysql

sudo firewall-cmd --permanent --zone=public --add-port=80/tcp

sudo firewall-cmd --reload

# configure DirectoryIndex to use index.php instead of index.html
sudo vi /etc/httpd/conf/httpd.conf 

sudo service httpd start
sudo systemctl enable httpd

sudo yum install -y git
git clone https://github.com/<app>.git /var/www/html/

curl http://localhost/
```
## Deployment Mode
- Single Node
- Multi Node


