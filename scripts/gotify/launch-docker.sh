docker run --net main_subnet --ip 172.30.4.1 \
  -v /opt/gotify/data:/app/data \
  --restart unless-stopped \
  gotify/server