docker run -d --net main_subnet --ip 172.30.21.1 \
  -e TZ=America/New_York \
  --name=wikijs \
  -v /opt/wikijs/config:/config \
  -v /opt/wikijs/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/wikijs:latest