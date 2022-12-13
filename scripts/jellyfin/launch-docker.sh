docker run --net main_subnet --ip 172.30.11.1 \
  -e TZ=America/New_York \
  --name=jellyfin \
  -e JELLYFIN_PublishedServerUrl=fin.docker.162536.xyz \
  -v /opt/jellyfin/config:/config \
  -v /opt/jellyfin/tvshows:/tvshows \
  -v /opt/jellyfin/movies:/movies \
  --restart unless-stopped \
  lscr.io/linuxserver/jellyfin:latest