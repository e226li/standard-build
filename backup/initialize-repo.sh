#!/bin/sh

. ./backup.conf

./borg-linux64 init -e repokey --make-parent-dirs