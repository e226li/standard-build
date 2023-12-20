docker run -d --net main_subnet --ip 172.30.27.1 \
  -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
  -v /opt/prometheus/data:/prometheus \
  --name=prometheus \
  --restart unless-stopped \
prom/prometheus