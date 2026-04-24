#!/usr/bin/env bash
set -euo pipefail

# Check-SystemHealth: quick health snapshot (CPU, memory, load, top processes)

printf "Time: %s\n" "$(date -Is 2>/dev/null || date)"

if command -v uptime >/dev/null 2>&1; then
  printf "Uptime: %s\n" "$(uptime -p 2>/dev/null || uptime)"
fi

if [ -f /proc/loadavg ]; then
  printf "Load: %s\n" "$(cat /proc/loadavg)"
fi

if command -v free >/dev/null 2>&1; then
  echo "Memory"
  free -h
fi

if command -v df >/dev/null 2>&1; then
  echo "Disk"
  df -hT | awk 'NR==1 || /^\//'
fi

if command -v ps >/dev/null 2>&1; then
  echo "Top CPU"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
fi