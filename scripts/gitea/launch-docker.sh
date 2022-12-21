docker run -d --net main_subnet --ip 172.30.16.1 \
  -e TZ=America/New_York \
  --name=gitea \
  -v /opt/gitea/data:/data \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -p 1022:22
  --restart unless-stopped \
  gitea/gitea:latest