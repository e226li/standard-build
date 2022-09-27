docker run -d --net main_subnet --ip 172.30.7.1 \
  --name=calibre-web \
  -e TZ=America/New_York \
  -e DOCKER_MODS=linuxserver/mods:universal-calibre `#optional` \
  -v /opt/calibre-web/config:/config \
  -v /opt/calibre-web/config/books:/books \
  --restart unless-stopped \
  lscr.io/linuxserver/calibre-web:latest