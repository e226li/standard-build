docker run -d --net main_subnet --ip 172.30.15.1 \
  -e TZ=America/New_York \
  --name=portainer \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /opt/portainer/data:/data \
  --restart unless-stopped \
  portainer/portainer-ce:latest