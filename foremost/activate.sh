#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-foremost" "$DIR"

alias foremost="$DIR/foremost/run.sh"
