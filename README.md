A simple tool manager written using shell and podman

Pre-requisites:
- podman (rootless)
- fzf 

Commands:
- `source ./all.sh` - Load aliases and functions (run this first)
- `add_tool <tool_name>` - Create image for a tool, https://www.kali.org/tools/
- `tool` - Use fzf to search for a tool
- `<tool_name>` - Alias to run a given tool
