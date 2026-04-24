#!/usr/bin/env bash
set -euo pipefail

# Check-DiskUsageReport: disk usage report

if command -v df >/dev/null 2>&1; then
  df -hT
else
  echo "df not found"
  exit 1
fi