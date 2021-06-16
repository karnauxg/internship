#!/bin/bash

sudo apt-get update 
sudo apt-get install -y nginx
sudo ufw allow 'Nginx HTTP'
sudo systemctl status nginx
