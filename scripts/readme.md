# Docker scripts

## 172.30.x.y

- 172.30.1.1: wallabag
- 172.30.2.1: grav
- 172.30.3.1: code-server
- 172.30.4.1: gotify
- 172.30.5.1: trilium
- 172.30.6.1: uptime-kuma 
- 172.30.7.1: calibre-web 
- 172.30.8.1: syncthing 
- 172.30.9.1: pigallery2 
- 172.30.10.1: gokapi 
- 172.30.11.1: jellyfin 
- 172.30.12.1: changedetector 
- 172.30.13.1: selenium
- 172.30.14.1: yourls 
- 172.30.15.1: portainer 
- 172.30.16.1: gitea 
- 172.30.17.1: nextcloud 
- 172.30.18.1: postgres 
- 172.30.19.1: freshrss 
- 172.30.20.1: photoprism 
- 172.30.21.1: wikijs 
- 172.30.22.1: HRConvert2 
- 172.30.23.1: healthchecks 
- 172.30.24.1: weechat 
- 172.30.25.1: thelounge 
- 172.30.26.1: minio 
- 172.30.27.1: prometheus 

## Extraction

This data was extracted using 
`grep -ro "172.30.*." . --exclude launch-docker.sh --exclude setup.py | awk -F: '{print "- " $2 FS $1}' | sort -V` 
and manually processed.