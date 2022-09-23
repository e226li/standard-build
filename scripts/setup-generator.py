import glob, importlib

with open("setup-template.py", "r") as f:
    setup_template = f.read()

directories = glob.glob("*/", recursive=False)

for directory in directories:
    current_setup_template = setup_template
    with open(f"{directory}/manifest.dat", "r") as f:
        manifest_info = [line_info.split() for line_info in f.read().split()]

    for replacement in manifest_info:
        if len(replacement) == 2:
            replacement.append(-1)

        current_setup_template.replace(replacement[0], replacement[1], int(replacement[2]))
    
    if glob.glob(f"{directory}/parser.py"):
        should_continue = input(f"Custom instructions found in {directory}, continue? (Y/N) ")
        if should_continue == "Y":
            parser = importlib.import_module(f"{directory}/parser.py")
            current_setup_template = parser.parse_template(current_setup_template)
        else:
            continue

    with open(f"{directory}/setup.py", "w") as f:
        f.write(current_setup_template)