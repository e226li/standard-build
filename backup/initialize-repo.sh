#!/bin/sh

. ./backup.conf

/usr/local/bin/borg-linux64 init -e repokey --make-parent-dirs