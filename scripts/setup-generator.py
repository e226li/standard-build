import glob, importlib, sys

with open("setup-template.py", "r") as f:
    setup_template = f.read()

directories = glob.glob("*/", recursive=False)

if len(sys.argv) >= 2:
    directories = sys.argv[1:]

for directory in directories:
    current_setup_template = setup_template
    with open(f"{directory}/manifest.dat", "r") as f:
        manifest_info = [line_info.split("\n@ ")[1:] for line_info in f.read().split("%")[1:]]

    for replacement in manifest_info:        
        if len(replacement) == 2:
            replacement.append("-1")
        
        print(replacement[0].rstrip(), replacement[1].rstrip(), int(replacement[2].rstrip().rstrip("\n")))
        current_setup_template = current_setup_template.replace(replacement[0].rstrip("\n"), replacement[1].rstrip("\n"), int(replacement[2].rstrip("\n")))
    
    if glob.glob(f"{directory}/parser.py"):
        should_continue = input(f"Custom instructions found in {directory}, continue? (Y/N) ")
        if should_continue == "Y":
            parser = importlib.import_module(f"{directory}/parser.py")
            current_setup_template = parser.parse_template(current_setup_template)
        else:
            continue

    with open(f"{directory}/setup.py", "w") as f:
        f.write(current_setup_template)