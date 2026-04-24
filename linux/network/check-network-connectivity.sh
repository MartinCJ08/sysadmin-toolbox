#!/usr/bin/env bash
set -euo pipefail

# Check-NetworkConnectivity: ping and DNS check
# Usage: ./check-network-connectivity.sh [host] [dns]

host=${1:-8.8.8.8}
dns=${2:-www.example.com}

if command -v ping >/dev/null 2>&1; then
  ping -c 4 "$host"
else
  echo "ping not found"
fi

if command -v getent >/dev/null 2>&1; then
  getent hosts "$dns"
elif command -v nslookup >/dev/null 2>&1; then
  nslookup "$dns"
elif command -v dig >/dev/null 2>&1; then
  dig "$dns" +short
else
  echo "No DNS lookup tool found"
fi