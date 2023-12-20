. /opt/minio/minio.conf

docker run -d --net main_subnet --ip 172.30.26.1 \
  -e TZ=America/New_York \
  -v /opt/minio/data:/data \
  -p 9000:9000 \
  --name=minio \
  -e "MINIO_ROOT_USER=$MINIO_USER" \
  -e "MINIO_ROOT_PASSWORD=$MINIO_PASSWORD" \
  -e "MINIO_SERVER_URL=$MINIO_SERVER_URL" \
  -e "MINIO_PROMETHEUS_URL=$PROMETHEUS_URL" \
  -e "MINIO_PROMETHEUS_JOB_ID=$PROMETHEUS_JOB_ID" \
  --restart unless-stopped \
quay.io/minio/minio server /data --console-address ":9090"