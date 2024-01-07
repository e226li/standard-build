#!/bin/bash

rm -rf /etc/nginx/sites-enabled/"$1".conf
systemctl restart nginx