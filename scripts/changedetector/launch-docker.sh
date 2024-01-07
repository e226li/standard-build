docker run --net main_subnet --ip 172.30.12.1 \
  -e TZ=America/New_York \
  --name=changedetector \
  -v /opt/changedetector/datastore:/datastore \
  -e WEBDRIVER_URL="http://172.30.13.1:4444/wd/hub" \
  --restart unless-stopped \
  dgtlmoon/changedetection.io