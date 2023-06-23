#!/bin/bash
set -e

export instance_name=internal-webserver
export nesting=false
export proto=tcp
export listen_ip=127.0.0.1
export internal_port=80
export external_port=81
export script='apt-get update -y && apt-get install curl && curl -sL https://github.com/that-github-guy/quick-deploy-scripts/raw/main/scripts/internal-webserver.sh | bash'

export wait=5

bash ../scripts/lxc.sh