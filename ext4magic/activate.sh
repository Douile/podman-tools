#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-ext4magic" "$DIR"

alias ext4magic="$DIR/ext4magic/run.sh"
