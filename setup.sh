#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y ca-certificates curl gnupg lsb-release nano wget tmux htop python3 python3-pip git certbot borgbackup jq

rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default