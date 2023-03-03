#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-testdisk" "$DIR"

alias testdisk="$DIR/testdisk/run.sh"
