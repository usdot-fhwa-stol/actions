#!/bin/bash

set -ex

apt-get update
apt-get -y install wget lsb-release

DISTRO_CODENAME=$(lsb_release -cs)
DISTRO_ID=$(lsb_release -is)

KEY_URL="https://raw.githubusercontent.com/deb-s3/deb-s3/master/deb-s3-archive-keyring.gpg"
SOURCE="deb http://deb-s3-repo.s3.us-east-2.amazonaws.com/${DISTRO_ID,,}/ $DISTRO_CODENAME main"

wget -O /etc/apt/trusted.gpg.d/deb-s3-archive-keyring.gpg "$KEY_URL"
echo "$SOURCE" | tee -a /etc/apt/sources.list
apt-get update
apt-get -y install deb-s3
