#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-binwalk" "$DIR"

alias binwalk="$DIR/binwalk/run.sh"
