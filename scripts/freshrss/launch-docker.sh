docker run -d --net main_subnet --ip 172.30.19.1 \
  -e TZ=America/New_York \
  --name=freshrss \
  -v /opt/freshrss/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/freshrss:latest