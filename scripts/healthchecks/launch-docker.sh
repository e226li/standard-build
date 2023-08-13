docker run -d --net main_subnet --ip 172.30.23.1 \
  -e TZ=America/New_York \
  --name=healthchecks \
  --restart unless-stopped \
  lscr.io/linuxserver/healthchecks:latest