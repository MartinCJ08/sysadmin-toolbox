<#
.SYNOPSIS
  Check-LogErrorScan: scan Windows Event Logs for recent errors
.PARAMETER LogName
  Event log name (default: System)
#>
param(
  [string]$LogName = 'System'
)

Get-WinEvent -LogName $LogName -MaxEvents 200 | Where-Object { $_.LevelDisplayName -in @('Error','Critical') } |
  Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message