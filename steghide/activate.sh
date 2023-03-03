#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-steghide" "$DIR"

alias steghide="$DIR/steghide/run.sh"
