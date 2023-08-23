#IMPORT
import os
import argparse

#PARSE_ARGS
parser = argparse.ArgumentParser()
parser.add_argument("domain")
parser.add_argument("email")
args = parser.parse_args()

#QUICK_RECOVER
os.makedirs(os.path.dirname("/opt/quick-recover/"), exist_ok=True)
with open("/opt/quick-recover/#service.conf", "w") as f:
    f.write(f"export DOMAIN='{args.domain}'\n")
    f.write(f"export EMAIL='{args.email}'\n")

#FILE_READ
with open("../nginx-site-template.conf", "r") as f:
    template = f.read().replace("#serverNameVar", f"{args.domain}").replace("#http://127.0.0.1:8080/", f"#ip_address")
    #ADDITIONAL_REPLACE

#FILE_WRITE
with open("/etc/nginx/sites-available/#service.conf", "w") as f:
    f.write(template)

#GET_CERT
os.system(f"sh ../getcert.sh {args.domain} {args.email}")

#GENERATE_NGINX
# depreceated, TODO: replace with os.subprocess
os.system("sh ../nginx-ensite.sh #service")

#START_CONTAINER
os.system("sh launch-docker.sh")

#POST_LAUNCH_COMMANDS