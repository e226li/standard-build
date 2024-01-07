#!/bin/bash

ln -s /etc/nginx/sites-available/"$1".conf /etc/nginx/sites-enabled/
systemctl restart nginx