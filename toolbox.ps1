<#
.SYNOPSIS
  Toolbox launcher
.DESCRIPTION
  Usage: .\toolbox.ps1 <category> <command> [args...]
#>
[CmdletBinding()]
param(
  [Parameter(Position=0)]
  [string]$Category,
  [Parameter(Position=1)]
  [string]$Command,
  [Parameter(ValueFromRemainingArguments=$true)]
  [string[]]$ArgsRemaining
)

function Show-Usage {
@'
Usage:
  toolbox.ps1 <category> <command> [args...]

Examples:
  toolbox.ps1 system summary
  toolbox.ps1 network check
  toolbox.ps1 security audit

Categories and commands:
  system    summary | updates | service
  network   check
  security  audit
  storage   usage
  users     audit
  backup    verify
  maintenance log-scan
  inventory export
'@
}

if ([string]::IsNullOrWhiteSpace($Category) -or [string]::IsNullOrWhiteSpace($Command)) {
  Show-Usage
  exit 1
}

$root = Split-Path -Parent $PSCommandPath
$script = $null

switch ($Category) {
  'system' {
    switch ($Command) {
      'summary' { $script = Join-Path $root 'windows/system/Check-HostSummary.ps1' }
      'host-summary' { $script = Join-Path $root 'windows/system/Check-HostSummary.ps1' }
      'updates' { $script = Join-Path $root 'windows/system/Check-PackageUpdateStatus.ps1' }
      'update-status' { $script = Join-Path $root 'windows/system/Check-PackageUpdateStatus.ps1' }
      'package-status' { $script = Join-Path $root 'windows/system/Check-PackageUpdateStatus.ps1' }
      'service' { $script = Join-Path $root 'windows/system/Check-ServiceCheck.ps1' }
      'service-check' { $script = Join-Path $root 'windows/system/Check-ServiceCheck.ps1' }
    }
  }
  'network' {
    switch ($Command) {
      'check' { $script = Join-Path $root 'windows/network/Check-NetworkConnectivity.ps1' }
      'connectivity' { $script = Join-Path $root 'windows/network/Check-NetworkConnectivity.ps1' }
    }
  }
  'security' {
    switch ($Command) {
      'audit' { $script = Join-Path $root 'windows/security/Check-SecurityBasics.ps1' }
      'basics' { $script = Join-Path $root 'windows/security/Check-SecurityBasics.ps1' }
    }
  }
  'storage' {
    switch ($Command) {
      'usage' { $script = Join-Path $root 'windows/storage/Check-DiskUsageReport.ps1' }
      'disk-usage' { $script = Join-Path $root 'windows/storage/Check-DiskUsageReport.ps1' }
    }
  }
  'users' {
    switch ($Command) {
      'audit' { $script = Join-Path $root 'windows/users/Check-UserGroupAudit.ps1' }
      'group-audit' { $script = Join-Path $root 'windows/users/Check-UserGroupAudit.ps1' }
    }
  }
  'backup' {
    switch ($Command) {
      'verify' { $script = Join-Path $root 'windows/backup/Check-BackupVerification.ps1' }
      'verification' { $script = Join-Path $root 'windows/backup/Check-BackupVerification.ps1' }
    }
  }
  'maintenance' {
    switch ($Command) {
      'log-scan' { $script = Join-Path $root 'windows/maintenance/Check-LogErrorScan.ps1' }
      'logs' { $script = Join-Path $root 'windows/maintenance/Check-LogErrorScan.ps1' }
      'error-scan' { $script = Join-Path $root 'windows/maintenance/Check-LogErrorScan.ps1' }
    }
  }
  'monitoring' {
    switch ($Command) {
      'health' { $script = Join-Path $root 'windows/monitoring/Check-SystemHealth.ps1' }
      'system-health' { $script = Join-Path $root 'windows/monitoring/Check-SystemHealth.ps1' }
    }
  }
  'inventory' {
    switch ($Command) {
      'export' { $script = Join-Path $root 'windows/inventory/Check-InventoryExport.ps1' }
    }
  }
  'help' { Show-Usage; exit 0 }
  '-h' { Show-Usage; exit 0 }
  '--help' { Show-Usage; exit 0 }
}

if (-not $script) {
  Write-Host "Unknown category/command: $Category $Command"
  Show-Usage
  exit 1
}

if (-not (Test-Path -Path $script)) {
  Write-Host "Script not found: $script"
  exit 1
}

& $script @ArgsRemaining
