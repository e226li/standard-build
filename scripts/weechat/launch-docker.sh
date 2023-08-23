docker run -ti --net main_subnet --ip 172.30.24.1 \
  -e TZ=America/New_York \
  -v /opt/weechat/config:/home/user/.config/weechat \
  -v /opt/weechat/data:/home/user/.local/share/weechat \
  -v /opt/weechat/cache:/home/user/.cache/weechat \
  --name=weechat \
  --restart unless-stopped \
  weechat/weechat