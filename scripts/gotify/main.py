import os, sys

with open("../nginx-site-template.conf", "r") as f:
    template = f.read().replace("#serverNameVar", f"{sys.argv[1]}").replace("#http://127.0.0.1:8080/", f"http://172.30.4.1:80/") \
        .replace("proxy_set_header Host $host;", "proxy_set_header Host $host;\n\tproxy_set_header Upgrade $http_upgrade;\n\tproxy_set_header Connection \"upgrade\";")

with open("/etc/nginx/sites-available/gotify.conf", "w") as f:
    f.write(template)
    
# depreceated, TODO: replace with os.subprocess
os.system("sh ../nginx-ensite.sh gotify")
os.system("sh launch-docker.sh")