import os
import argparse
import warnings


def get_cached_email() -> str:
    with open("../email.cache", "r") as f:
        email = f.read().strip()
    return email


def cache_email(email: str) -> None:
    try:
        with open("../email.cache", "w") as f:
            f.write(email)
    except Exception as e:
        warnings.warn(e, Warning)


parser = argparse.ArgumentParser()
parser.add_argument("domain")
parser.add_argument("email", nargs='?', default=None) # to not recache emails retreived from cache
parser.add_argument("cache_email", nargs='?', default=True)
args = parser.parse_args()

if args.cache_email is True and args.email is not None:
    cache_email(args.email)
if args.email is None:
    args.email = get_cached_email()

os.makedirs(os.path.dirname("/opt/quick-recover/"), exist_ok=True)
with open("/opt/quick-recover/minio-api.conf", "w") as f:
    f.write(f"export DOMAIN='{args.domain}'\n")
    f.write(f"export EMAIL='{args.email}'\n")

with open("nginx-api-proxy-template.conf", "r") as f:
    template = f.read().replace("#serverNameVar", f"{args.domain}")

with open("/etc/nginx/sites-available/minio-api.conf", "w") as f:
    f.write(template)

os.system(f"sh ../getcert.sh {args.domain} {args.email}")

os.system("sh ../nginx-ensite.sh minio-api")
