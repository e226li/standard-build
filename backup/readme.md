# Backups

Example cron:
```sh
32 * * * * /bin/sh /root/standard-build/backup/backup-script.sh >/root/last-backup-log.txt 2>&1
```