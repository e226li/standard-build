#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y ca-certificates curl gnupg lsb-release nano wget tmux htop python3 python3-pip git

git clone https://git.162536.xyz/drunkendog/standard-build.git

cd scripts
exec bash