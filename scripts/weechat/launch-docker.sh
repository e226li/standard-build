docker run -ti --net main_subnet --ip 172.30.24.1 \
  -e TZ=America/New_York \
  -v /opt/weechat/config:/home/user/.weechat \
  --name=weechat \
  --restart unless-stopped \
  weechat/weechat weechat --dir /home/user/.weechat