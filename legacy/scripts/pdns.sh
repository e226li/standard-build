#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y ca-certificates curl gnupg lsb-release nano wget tmux

sed -i 's/#DNSStubListener=yes/DNSStubListener=no/' /etc/systemd/resolved.conf
sed -i 's/127.0.0.53/8.8.8.8/' /etc/resolv.conf
systemctl restart systemd-resolved
ping -c 1 google.com # checks to see DNS connectivity still exists

webserverkey=$(date +%s | sha256sum | base64 | head -c 32) # INSECURE, use openssl rand -hex
apt-get install -y pdns-server pdns-backend-sqlite3 sqlite3
mkdir /var/lib/powerdns || true
sqlite3 /var/lib/powerdns/pdns.sqlite3 < /usr/share/doc/pdns-backend-sqlite3/schema.sqlite3.sql || true
chown -R pdns:pdns /var/lib/powerdns
tee -a /etc/powerdns/pdns.conf << EOF
gsqlite3-database=/var/lib/powerdns/pdns.sqlite3
webserver=yes
webserver-address=0.0.0.0
webserver-allow-from=127.0.0.1,10.0.0.0/8,172.0.0.0/8
webserver-port=8081
webserver-password=$webserverkey
api=yes
api-key=$webserverkey
EOF
systemctl restart pdns

apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # snippet from docker
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
docker run hello-world

secretkey=$(date +%s | sha256sum | base64 | head -c 32)
docker run -d \
    -e SECRET_KEY=$secretkey \
    -v pda-data:/data \
    -p 9191:80 \
    ngoduykhanh/powerdns-admin:latest

echo '{$webserverkey}'