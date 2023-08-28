FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y ca-certificates curl gnupg lsb-release nano wget tmux htop python3 python3-pip git certbot borgbackup jq && rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]