#!/usr/bin/env bash
set -euo pipefail

# Check-HostSummary: basic host summary

hostname_cmd=$(command -v hostname || true)
[ -n "$hostname_cmd" ] && host_name=$(hostname) || host_name="unknown"

os_name="unknown"
if [ -f /etc/os-release ]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  os_name="$NAME"
fi

kernel=$(uname -r)

uptime_pretty="unknown"
if command -v uptime >/dev/null 2>&1; then
  if uptime -p >/dev/null 2>&1; then
    uptime_pretty=$(uptime -p)
  else
    uptime_pretty=$(uptime)
  fi
fi

ip_addrs="unknown"
if command -v ip >/dev/null 2>&1; then
  ip_addrs=$(ip -o -4 addr show | awk '{print $2 ":" $4}' | paste -sd "," -)
elif command -v ifconfig >/dev/null 2>&1; then
  ip_addrs=$(ifconfig | awk '/inet / {print $2}' | paste -sd "," -)
fi

cpu="unknown"
if command -v lscpu >/dev/null 2>&1; then
  cpu=$(lscpu | awk -F: '/Model name/ {print $2}' | xargs)
fi

mem="unknown"
if command -v free >/dev/null 2>&1; then
  mem=$(free -h | awk '/Mem:/ {print $2" total, "$3" used"}')
fi

printf "Host Summary\n"
printf "Host: %s\n" "$host_name"
printf "OS: %s\n" "$os_name"
printf "Kernel: %s\n" "$kernel"
printf "Uptime: %s\n" "$uptime_pretty"
printf "IPs: %s\n" "$ip_addrs"
printf "CPU: %s\n" "$cpu"
printf "Memory: %s\n" "$mem"