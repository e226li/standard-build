#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y git apache2

cd /var/www/html/
git clone https://github.com/that-github-guy/quick-deploy-scripts.git
# { crontab -l -u root; echo '*/15 * * * * cd /var/www/html/quick-deploy-scripts/ && git pull --ff-only main'; } | crontab -u root -