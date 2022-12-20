import socket
import hashlib
import os
import getpass

server_hostname = input("Enter backup server subdomain: ").rstrip()
hostname = input("Enter subdomain: ").rstrip()

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
ip_address = s.getsockname()[0]
s.close()

assert socket.gethostbyname(hostname + ".162536.xyz") == ip_address, "Hostname does not resolve to ip!"

secret_seed = getpass.getpass("Enter passphrase: ").rstrip()
assert getpass.getpass("Confirm passhphrase: ").rstrip() == secret_seed, "Passphrases do not match!"

salted_secret_seed = hostname + secret_seed
salted_hash_value = hashlib.sha512(salted_secret_seed.encode())

with open("/etc/backup.conf", "w") as f:
    f.write(f"export BORG_REPO='ssh://{hostname}@{server_hostname}.162536.xyz:22/~/backup/docker'\n")
    f.write(f"export BORG_PASSPHRASE='{salted_hash_value.hexdigest()}'\n")

os.system("ssh-keygen -t rsa -q -f \"$HOME/.ssh/id_rsa\" -N \"\"")

input(f"Waiting for user creation: press enter when user created - suggested password: {os.system('openssl rand -hex 20')}")
os.system(f"ssh-copy-id {hostname}@{server_hostname}.162536.xyz")
