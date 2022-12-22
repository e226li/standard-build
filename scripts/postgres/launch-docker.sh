. /opt/postgres/postgres.conf

docker run -d --net main_subnet --ip 172.30.18.1 \
  -e TZ=America/New_York \
  --name=postgres \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -v /opt/postgres/data:/var/lib/postgresql/data \
  --restart unless-stopped \
  postgres