#!/usr/bin/env bash
set -euo pipefail

# Check-SecurityBasics: quick security posture checks

echo "SSH Root Login setting"
if [ -f /etc/ssh/sshd_config ]; then
  grep -iE "^PermitRootLogin" /etc/ssh/sshd_config | tail -n 1 || echo "Not set"
else
  echo "sshd_config not found"
fi

echo "Firewall status"
if command -v ufw >/dev/null 2>&1; then
  ufw status
elif command -v firewall-cmd >/dev/null 2>&1; then
  firewall-cmd --state
else
  echo "No firewall tool found"
fi