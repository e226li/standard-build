docker run -d --net main_subnet --ip 172.30.22.1 \
  -e TZ=America/New_York \
  --name=HRConvert2 \
  --restart unless-stopped \
  dwaaan/hrconvert2-docker