. /opt/minio/minio.conf

docker run -d --net main_subnet --ip 172.30.26.1 \
  -e TZ=America/New_York \
  -v /opt/minio/data:/data \
  --name=minio \
  -e "MINIO_ROOT_USER=$MINIO_USER" \
  -e "MINIO_ROOT_PASSWORD=$MINIO_PASSWORD" \
  --restart unless-stopped \
quay.io/minio/minio server /data --console-address ":9090"