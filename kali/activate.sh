#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali" "$DIR"

alias kali="podman run --rm -it -v \"\$PWD:/mnt\" kali"
