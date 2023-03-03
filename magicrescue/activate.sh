#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-magicrescue" "$DIR"

alias magicrescue="$DIR/magicrescue/run.sh"
