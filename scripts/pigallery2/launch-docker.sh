docker run --net main_subnet --ip 172.30.9.1 \
  -e NODE_ENV=production \
  -v /opt/pigallery2/config/config.json:/pigallery2-release/config.json \
  -v /opt/pigallery2/sqlite/sqlite.db:/pigallery2-release/sqlite.db \
  -v /opt/syncthing/data1/images:/pigallery2-release/demo/images \
  -v /opt/pigallery2/TEMP:/pigallery2-release/demo/TEMP \
  bpatrik/pigallery2:1.7.0-stretch