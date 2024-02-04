docker run -d --net main_subnet --ip 172.30.29.1 \
  -v /opt/paperless-ngx/config:/config \
  -v /opt/paperless-ngx/data:/data \
  -e TZ=America/New_York \
  --restart unless-stopped \
  --name=paperless-ngx \
  lscr.io/linuxserver/paperless-ngx:latest
