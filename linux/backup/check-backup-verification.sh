#!/usr/bin/env bash
set -euo pipefail

# Check-BackupVerification: verify backup file checksum
# Usage: ./check-backup-verification.sh <backup_file> <checksum_file>

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <backup_file> <checksum_file>"
  exit 1
fi

backup=$1
checksum=$2

if command -v sha256sum >/dev/null 2>&1; then
  sha256sum -c "$checksum" --status && echo "OK" || echo "FAILED"
else
  echo "sha256sum not found"
  exit 1
fi