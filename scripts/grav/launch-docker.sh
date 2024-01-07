docker run --net main_subnet --ip 172.30.2.1 \
  -e TZ=America/New_York \
  -v /opt/grav/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/grav:latest