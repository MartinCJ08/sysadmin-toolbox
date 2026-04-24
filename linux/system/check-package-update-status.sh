#!/usr/bin/env bash
set -euo pipefail

# Check-PackageUpdateStatus: list available updates

if command -v apt >/dev/null 2>&1; then
  apt list --upgradable 2>/dev/null || true
elif command -v yum >/dev/null 2>&1; then
  yum check-update || true
elif command -v dnf >/dev/null 2>&1; then
  dnf check-update || true
elif command -v zypper >/dev/null 2>&1; then
  zypper list-updates || true
else
  echo "No supported package manager found"
fi