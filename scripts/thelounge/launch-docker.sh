docker run -d --net main_subnet --ip 172.30.25.1 \
  -e TZ=America/New_York \
  -v /opt/thelounge/config:/config \
  --name=thelounge \
  --restart unless-stopped \
  lscr.io/linuxserver/healthchecks:latest