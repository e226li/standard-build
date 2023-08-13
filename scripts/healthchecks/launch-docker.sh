. ./environment.conf
docker run -d --net main_subnet --ip 172.30.23.1 \
  -e TZ=America/New_York \
  -e DEBUG=False \
  -e SITE_ROOT=$SITE_ROOT \
  -e DEFAULT_FROM_EMAIL=$DEFAULT_FROM_EMAIL \
  -e EMAIL_HOST=$EMAIL_HOST \
  -e EMAIL_PORT=$EMAIL_PORT \
  -e EMAIL_HOST_USER=$EMAIL_HOST_USER \
  -e EMAIL_HOST_PASSWORD=$EMAIL_HOST_PASSWORD \
  -e EMAIL_USE_TLS=True \
  -v /opt/healthchecks/config:/config \
  --name=healthchecks \
  --restart unless-stopped \
  lscr.io/linuxserver/healthchecks:latest