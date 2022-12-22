docker run -d --net main_subnet --ip 172.30.17.1 \
  -e TZ=America/New_York \
  --name=nextcloud \
  -v /opt/nextcloud/config:/config \
  -v /opt/nextcloud/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/nextcloud:latest