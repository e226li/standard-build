docker run --net main_subnet --ip 172.30.13.1 \
  -e TZ=America/New_York \
  --name=selenium \
  -v /opt/changedetector/datastore:/datastore \
  --restart unless-stopped \
  --shm-size="2g" \
  selenium/standalone-chrome