docker run --net main_subnet --ip 172.30.8.1 \
  -e TZ=America/New_York \
  --name=syncthing \
  --hostname=sync.162536.xyz `#optional` \
  -p 22000:22000/tcp \
  -p 22000:22000/udp \
  -p 21027:21027/udp \
  -v /opt/syncthing/config:/config \
  -v /opt/syncthing/data1:/data1 \
  -v /opt/syncthing/data2:/data2 \
  --restart unless-stopped \
  lscr.io/linuxserver/syncthing:latest