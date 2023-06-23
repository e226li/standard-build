#!/bin/bash
set -e

# TODO: make it take arguments instead of environment variables
lxc launch ubuntu:18.04 $instance_name -c security.nesting=$nesting
lxc config device add $instance_name auto$instance_name proxy listen=$proto:$listen_ip:$external_port connect=$proto:127.0.0.1:$internal_port
sleep $wait | true # wait for network, TODO: more elegant solution
lxc exec $instance_name -- bash -c "$script"