docker run --net main_subnet --ip 172.30.3.1 \
  -e TZ=America/New_York \
  -e HASHED_PASSWORD=$argon2i$v=19$m=4096,t=3,p=1$oknF+Lx2y3EEI8Fxok9esw$prtj9H0o/qCynmKyz+9wcn1j5z8xKBN2aFcmPggJ1oA \
  -e SUDO_PASSWORD_HASH=$argon2i$v=19$m=4096,t=3,p=1$oknF+Lx2y3EEI8Fxok9esw$prtj9H0o/qCynmKyz+9wcn1j5z8xKBN2aFcmPggJ1oA \
  -v /opt/code-server/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest