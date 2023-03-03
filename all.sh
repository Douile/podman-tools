#!/bin/sh

TOOL_DIR=$(dirname "$0")

. "$TOOL_DIR/functions.sh"

IFS="$(printf "\0")"
for file in $(find "$TOOL_DIR" -type f -name "activate.sh" -print0); do
  if [ -f "$file" ]; then
    echo "Loading $file"
    . "$file"
  fi
done

