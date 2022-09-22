import os, sys

with open("../nginx-site-template.conf", "r") as f:
    template = f.read().replace("#serverNameVar", f"server_name {sys.argv[1]};")

with open("/etc/nginx/sites-available/wallabag.conf", "w") as f:
    f.write(template)
    
# depreceated, TODO: replace with os.subprocess
os.system("../nginx-ensite.sh wallabag.conf")