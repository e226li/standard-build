docker run --net main_subnet --ip 172.30.12.1 \
  -e TZ=America/New_York \
  --name=changedetector \
  -v /opt/changedetector/datastore:/datastore \
  --restart unless-stopped \
  dgtlmoon/changedetection.io