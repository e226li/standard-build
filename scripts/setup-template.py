#IMPORT
import os, sys

#FILE_READ
with open("../nginx-site-template.conf", "r") as f:
    template = f.read().replace("#serverNameVar", f"{sys.argv[1]}").replace("#http://127.0.0.1:8080/", f"#ip_address")

#FILE_WRITE
with open("/etc/nginx/sites-available/#service.conf", "w") as f:
    f.write(template)

#GENERATE_NGINX
# depreceated, TODO: replace with os.subprocess
os.system("sh ../nginx-ensite.sh #service")

#START_CONTAINER
os.system("sh launch-docker.sh")