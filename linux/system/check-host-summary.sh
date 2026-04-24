#!/usr/bin/env bash
set -euo pipefail

# Hostname
host_name=$(hostname 2>/dev/null || echo "unknown")

# OS
os_name="unknown"
if [ -f /etc/os-release ]; then
  . /etc/os-release
  os_name="$NAME"
elif command -v sw_vers >/dev/null 2>&1; then
  os_name=$(sw_vers -productName)" "$(sw_vers -productVersion)
fi

# Kernel
kernel=$(uname -r)

# Uptime
uptime_pretty="unknown"
if command -v uptime >/dev/null 2>&1; then
  if uptime -p >/dev/null 2>&1; then
    uptime_pretty=$(uptime -p)
  else
    uptime_pretty=$(uptime)
  fi
fi

# IPs
ip_addrs="unknown"
if command -v ip >/dev/null 2>&1; then
  ip_addrs=$(ip -o -4 addr show | awk '{print $2 ":" $4}' | paste -sd "," -)
elif command -v ifconfig >/dev/null 2>&1; then
  ip_addrs=$(ifconfig | awk '/inet / && $2 != "127.0.0.1" {print $2}' | paste -sd "," -)
fi

# CPU
cpu="unknown"
if command -v lscpu >/dev/null 2>&1; then
  cpu=$(lscpu | awk -F: '/Model name/ {print $2}' | xargs)
elif command -v sysctl >/dev/null 2>&1; then
  cpu=$(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo "unknown")
fi

# Memory
mem="unknown"
if command -v free >/dev/null 2>&1; then
  mem=$(free -h | awk '/Mem:/ {print $2" total, "$3" used"}')
elif command -v sysctl >/dev/null 2>&1; then
  total_mem=$(sysctl -n hw.memsize)
  total_mem_gb=$(echo "$total_mem / 1024 / 1024 / 1024" | bc)
  mem="${total_mem_gb} GB total"
fi

printf "Host Summary\n"
printf "Host: %s\n" "$host_name"
printf "OS: %s\n" "$os_name"
printf "Kernel: %s\n" "$kernel"
printf "Uptime: %s\n" "$uptime_pretty"
printf "IPs: %s\n" "$ip_addrs"
printf "CPU: %s\n" "$cpu"
printf "Memory: %s\n" "$mem"