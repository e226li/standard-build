docker run -d --net main_subnet --ip 172.30.9.1 \
  --name=gokapi \
  -e TZ=America/New_York \
  --restart unless-stopped \
  f0rc3/gokapi