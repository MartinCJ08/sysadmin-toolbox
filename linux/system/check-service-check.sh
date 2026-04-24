#!/usr/bin/env bash
set -euo pipefail

# Check-ServiceCheck: service status check
# Usage: ./check-service-check.sh <service1> [service2 ...]

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <service1> [service2 ...]"
  exit 1
fi

for svc in "$@"; do
  if command -v systemctl >/dev/null 2>&1; then
    systemctl is-active --quiet "$svc" && status="active" || status="inactive"
  elif command -v service >/dev/null 2>&1; then
    service "$svc" status >/dev/null 2>&1 && status="active" || status="inactive"
  else
    status="unknown"
  fi
  printf "%s: %s\n" "$svc" "$status"
done