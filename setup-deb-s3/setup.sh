#!/bin/bash

set -ex

if [ "$(id --user)" -eq "0" ]; then
    sudocmd=""
else
    sudocmd="sudo"
fi

if ! which lsb_release; then
    $sudocmd apt-get update || true
    $sudocmd apt-get -y install lsb-release
fi

DISTRO_CODENAME=$(lsb_release -cs)
DISTRO_ID=$(lsb_release -is)
# Supported codenames and IDs found here: https://github.com/deb-s3/deb-s3/blob/master/.github/workflows/deb-release.yml
SUPPORTED_CODENAMES=("bullseye" "jammy" "kinetic")
SUPPORTED_IDS=("Debian" "Ubuntu")

SUPPORTED="false"
for SUPPORTED_ID in "${SUPPORTED_IDS[@]}"; do
    if [ "$DISTRO_ID" == "$SUPPORTED_ID" ]; then
    SUPPORTED="true"
    fi
done

if [ "$SUPPORTED" == "false" ]; then
    echo "Unsupported distro ID: $DISTRO_ID, exiting"
    exit 1
fi

SUPPORTED="false"
for SUPPORTED_CODENAME in "${SUPPORTED_CODENAMES[@]}"; do
    if [ "$DISTRO_CODENAME" == "$SUPPORTED_CODENAME" ]; then
    SUPPORTED="true"
    fi
done

if [ "$SUPPORTED" == "true" ]; then
    echo "Supported distro codename: $DISTRO_CODENAME"

    KEY_URL="https://deb-s3.github.io/deb-s3/gpg.key"
    SOURCE="deb https://deb-s3.github.io/deb-s3 deb-s3 main"
    #SOURCE="deb http://deb-s3-repo.s3.us-east-2.amazonaws.com/${DISTRO_ID,,}/ $DISTRO_CODENAME main"

    $sudocmd apt-get update || true
    $sudocmd apt-get -y install wget
    #$sudocmd wget -O /etc/apt/trusted.gpg.d/deb-s3-archive-keyring.gpg "$KEY_URL"
    $sudocmd wget -O /etc/apt/trusted.gpg.d/deb-s3-keyring.asc "$KEY_URL"
    echo "$SOURCE" | $sudocmd tee -a /etc/apt/sources.list
    $sudocmd apt-get update || true
    $sudocmd apt-get -y install deb-s3
else
    echo "Unsupported distro codename: $DISTRO_CODENAME, falling back to gem install"

    $sudocmd apt-get update || true
    $sudocmd apt-get -y install ruby
    $sudocmd gem install deb-s3
fi
