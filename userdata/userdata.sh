#!/bin/bash

echo "Start an app"
sudo apt-get update
sudo apt-get -y install apache2 zip unzip

mkdir -p /var/www/html
cd /var/www/html
rm -r ./*
unzip /etc/app.zip -d ./
chmod -R 755 ./*
chown -R www-data:www-data ./*
systemctl start apache2 
systemctl status apache2 

