#!/usr/bin/env bash
set -euo pipefail

# Check-UserGroupAudit: list users and groups

if [ -f /etc/passwd ]; then
  echo "Users (name:uid:gid)"
  awk -F: '{print $1":"$3":"$4}' /etc/passwd
fi

if [ -f /etc/group ]; then
  echo "Groups (name:gid)"
  awk -F: '{print $1":"$3}' /etc/group
fi