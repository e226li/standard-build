#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y apache2 certbot python3-certbot-apache

certbot run -n --apache --agree-tos -d $1 -m $2 --redirect