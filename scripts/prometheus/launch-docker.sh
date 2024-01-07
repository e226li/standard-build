docker run -d --net main_subnet --ip 172.30.27.1 \
  -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
  -v /opt/prometheus/web.yml:/etc/prometheus/web.yml \
  -v /opt/prometheus/data:/prometheus \
  --name=prometheus \
  --restart unless-stopped \
prom/prometheus --config.file=/etc/prometheus/prometheus.yml --web.config.file=/etc/prometheus/web.yml