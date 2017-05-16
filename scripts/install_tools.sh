#!/bin/bash -e

grep 'ubuntu' /etc/os-release || (echo "This script only works on a recent Ubuntu. Sorry."; exit 1)

sudo apt update
sudo apt install -y wget xz-utils curl jq python3
snap install docker
