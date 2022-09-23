#/bin/sh

systemctl stop nginx
certbot certonly -n --standalone --agree-tos -d $1 -m $2
systemctl start nginx