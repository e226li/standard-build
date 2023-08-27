#!/bin/sh

set -e

download_version=curl -s https://api.github.com/repos/borgbackup/borg/releases/latest | jq -r '.name'
download_url=curl -s https://api.github.com/repos/borgbackup/borg/releases/latest | jq -r '.assets | .[] | select(.name == "borg-linux64") | .browser_download_url'

echo "Version: $download_version"
echo "URL: $download_url"
echo 'Continue (y/N)?'
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then 
    exit 1
fi

wget -4 -O /usr/local/bin/borg-linux64 $download_url
chmod -v +x /usr/local/bin/borg-linux64 