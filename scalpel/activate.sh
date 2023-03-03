#!/bin/sh

DIR=$(dirname "$0")
podman build -t "kali-scalpel" "$DIR"

alias scalpel="$DIR/scalpel/run.sh"
