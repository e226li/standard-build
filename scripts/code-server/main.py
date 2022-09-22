import os, sys

with open("../nginx-site-template.conf", "r") as f:
    template = f.read().replace("#serverNameVar", f"{sys.argv[1]}").replace("#http://127.0.0.1:8080/", f"http://172.30.3.1:8443/")

with open("/etc/nginx/sites-available/code-server.conf", "w") as f:
    f.write(template)
    
# depreceated, TODO: replace with os.subprocess
os.system("sh ../nginx-ensite.sh code-server")
os.system("sh launch-docker.sh")