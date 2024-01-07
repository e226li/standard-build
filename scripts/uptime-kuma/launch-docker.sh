docker run --net main_subnet --ip 172.30.6.1 \
  -v /opt/uptime-kuma:/app/data \
  --restart unless-stopped \
  louislam/uptime-kuma:1