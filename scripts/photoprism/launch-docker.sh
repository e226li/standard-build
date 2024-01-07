read -s -p "Password: " admin_password
docker run -d --net main_subnet --ip 172.30.20.1 \
  -e TZ=America/New_York \
  --name=photoprism \
  -e PHOTOPRISM_UPLOAD_NSFW="true" \
  -e PHOTOPRISM_ADMIN_PASSWORD=$admin_password \
  -v /opt/photoprism/storage:/photoprism/storage \
  -v /opt/syncthing/data1/images:/photoprism/originals \
  --restart unless-stopped \
  photoprism/photoprism