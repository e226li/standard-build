docker run --net main_subnet --ip 172.30.4.1 \
  -v /opt/code-trilium/trilium-data:/home/node/trilium-data \
  --restart unless-stopped \
  zadam/trilium