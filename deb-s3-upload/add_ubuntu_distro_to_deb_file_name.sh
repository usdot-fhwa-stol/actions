#!/bin/bash

set -ex
# Check if the directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <ubuntu-distro>"
    exit 1
fi

# Check if the provided directory is valid
if [ -z "$1" ]; then
    echo "No ubuntu-disto-provided!"
    exit 1
fi
ubuntu_distro="$1"
deb_filename="$(find deb-packages -name "*.deb")"
if [ -z "$deb_file" ]; then
    echo "No .deb file found in the directory."
    exit 1
fi
new_debfilename="${ubuntu_distro}_${deb_filename}"
