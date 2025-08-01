#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
echo "Hello from private EC2" > /var/www/html/index.html
