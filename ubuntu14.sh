#!/bin/bash

apt-get install make gcc libelf-dev
apt-get install dpkg-dev
apt-get build-dep linux
codename=$(lsb_release -sc)
sudo tee /etc/apt/sources.list.d/ddebs.list << EOF
deb http://ddebs.ubuntu.com/ ${codename} main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-security main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com/ ${codename}-proposed main restricted universe multiverse
EOF

# add APT key
wget -Nq http://ddebs.ubuntu.com/dbgsym-release-key.asc -O- | sudo apt-key add -
apt-get update && apt-get install linux-image-$(uname -r)-dbgsym
