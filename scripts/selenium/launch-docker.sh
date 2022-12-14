docker run -d --net main_subnet --ip 172.30.13.1 \
  -e TZ=America/New_York \
  --name=selenium \
  --restart unless-stopped \
  --shm-size="2g" \
  selenium/standalone-chrome