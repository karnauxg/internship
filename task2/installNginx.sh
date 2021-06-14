#!/bin/bash

sudo apt update
sudo apt install -y nginx
sudo chmod 777 /var/www/html/index.nginx-debian.html
sudo echo "<font size="5" face="Arial">Hello World</font><hr>" > /var/www/html/index.nginx-debian.html
sudo uname -a >>/var/www/html/index.nginx-debian.html
sudo chmod 644 /var/www/html/index.nginx-debian.html
sudo systemctl enable nginx
sudo systemctl start nginx
