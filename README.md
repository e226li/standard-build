# standard-build

A collection of scripts to facilitate reproducible deployments of open-source applications locally.

Tested on Ubuntu 22.04 LTS.

## Installation

```bash
curl -sL https://github.com/e226li/standard-build/blob/main/setup.sh | bash && cd standard-build/
```

or alternatively

```bash
git clone https://github.com/e226li/standard-build
cd standard-build/
```

Then

```bash
./get-docker.sh
```

## Usage

```bash
./post-pull.sh
```

Then (note that email is optional once there is an `email.cache` file in `scripts/`)

```bash
cd scripts/
cd {program}/
python3 setup.py {domain} {email}```
```

Your program has now been launched, and its data volume is mounted at ```/opt/{program}```.

## Backups

```bash
cd backup/
./fetch-borg-latest.sh
python3 generate-config.py
```

and follow the prompts.

Then, install a crontab with a random time

```bash
crontab -e
```

with content

```bash
30 * * * * /bin/sh /{user}/standard-build/backup/backup-script.sh >/{user}/last-backup-log.txt 2>&1
```

and backups can be tested using `python3 backup/check-backup.py`
