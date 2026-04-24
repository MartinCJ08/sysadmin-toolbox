#!/usr/bin/env bash
set -euo pipefail

# Check-LogErrorScan: scan logs for recent errors
# Usage: ./check-log-error-scan.sh [path]

log_path=${1:-/var/log/syslog}

if [ ! -f "$log_path" ]; then
  echo "Log file not found: $log_path"
  exit 1
fi

# Show last 100 error-like lines
grep -iE "error|fail|critical|panic|fatal" "$log_path" | tail -n 100