import sys
import glob
import os

directories = sys.argv[1:]

for directory in directories:
    if not glob.glob(f"{directory}/manifest.dat"):
        raise FileNotFoundError
    with open(f"{directory}/manifest.dat", "r") as f:
        manifest_info = [line_info.split("\n@ ")[1:] for line_info in f.read().split("%")[1:]]
    for replacement in manifest_info:
        if replacement[0] == "#service":
            os.system(f". /opt/quick-recover/{replacement[1]}.conf; python3 {directory}/setup.py $DOMAIN $EMAIL")
            break