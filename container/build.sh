#!/bin/bash

apt-get update
apt-get upgrade -yq
apt-get install -y locales
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8

export LANG=en_US.utf8

# Update Packages
apt-get update \
    apt-get upgrade -yq

# builder user
adduser --home /home/builder --disabled-password --shell /bin/bash --gecos "" --uid 3000 --gid 100 builder

# npm install deps (to save time after)

mkdir -p /home/builder/certificare-base-deps
cp /container/data/package.json /home/builder/certificare-base-deps
chown -R builder. /home/builder/certificare-base-deps
cd /home/builder/certificare-base-deps
su builder -c 'npm install -g'

#--
# Cleaning
apt-get -yq clean
apt-get -yq autoremove
rm -rf /var/lib/apt/lists/*
