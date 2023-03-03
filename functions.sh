#!/bin/sh

TOOL_DIR="$(readlink -f "$(dirname "$0")")"

add_tool() {
  tool_name="$1"
  echo "Creating tool \"$tool_name\""
  mkdir -p "$TOOL_DIR/$tool_name"
  podman run --rm -it kali apt info "$tool_name" >"$TOOL_DIR/$tool_name/info"
  cat <<EOF > "$TOOL_DIR/$tool_name/Dockerfile"
FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y $tool_name
WORKDIR /mnt
EOF
  cat <<EOF > "$TOOL_DIR/$tool_name/activate.sh"
#!/bin/sh

DIR=\$(dirname "\$0")
podman build -t "kali-$tool_name" "\$DIR"

alias $tool_name="\$DIR/$tool_name/run.sh"
EOF
  cat <<EOF > "$TOOL_DIR/$tool_name/run.sh"
#!/bin/sh

podman run --rm -v "\$PWD:/mnt" -it "kali-$tool_name"
EOF
  chmod +x "$TOOL_DIR/$tool_name/run.sh"
  . "$TOOL_DIR/$tool_name/activate.sh"
}

tool() {
  echo "$TOOL_DIR"
  tool_name=$(find "$TOOL_DIR" -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 -n1 basename | fzf --preview="cat $TOOL_DIR/{1}/info")
  if [ "$tool_name" != "" ]; then 
    echo "Running $tool_name"
    "$TOOL_DIR/$tool_name/run.sh"
  fi
}
