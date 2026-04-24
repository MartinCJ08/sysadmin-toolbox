#!/usr/bin/env bash
set -euo pipefail

# Check-InventoryExport: basic hardware/software inventory

host=$(hostname)
os="unknown"
if [ -f /etc/os-release ]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  os="$NAME"
fi

printf "host,os,kernel\n"
printf "%s,%s,%s\n" "$host" "$os" "$(uname -r)"