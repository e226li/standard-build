#!/bin/sh

set -e

wget -4 -O /usr/local/bin/borg-linux64 $(curl -s https://api.github.com/repos/borgbackup/borg/releases/latest| jq -r '.assets | .[] | select(.name == "borg-linux64") | .browser_download_url')
chmod -v +x /usr/local/bin/borg-linux64 