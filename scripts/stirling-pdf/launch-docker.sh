docker run -d --net main_subnet --ip 172.30.28.1 \
  -v /opt/stirling-pdf/trainingData:/usr/share/tesseract-ocr/5/tessdata \
  -v /opt/stirling-pdf/extraConfigs:/configs \
  -v /opt/stirling-pdf/logs:/logs \
  -v /opt/stirling-pdf/customFiles:/customFiles \
  -e DOCKER_ENABLE_SECURITY=true \
  -e SECURITY_ENABLE_LOGIN=true \
  --name stirling-pdf \
  --restart unless-stopped \
  frooodle/s-pdf:latest
