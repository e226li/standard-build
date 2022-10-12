docker run --net main_subnet --ip 172.30.3.1 \
  -e TZ=America/New_York \
  -e PASSWORD=dummy \
  -e SUDO_PASSWORD=dummy \
  -e HASHED_PASSWORD=\$argon2i\$v=19\$m=4096,t=3,p=1\$WD857amD54lMv03z9jZl3A\$mP42PYPAmz3dwMV46r6RHf9h8l4FakxbSPO0MnWok7M \
  -e SUDO_PASSWORD_HASH='$argon2i$v=19$m=4096,t=3,p=1$WD857amD54lMv03z9jZl3A$mP42PYPAmz3dwMV46r6RHf9h8l4FakxbSPO0MnWok7M' \
  -v /opt/code-server/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest