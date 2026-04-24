<#
.SYNOPSIS
  Check-UserGroupAudit: list local users and groups
#>
Get-LocalUser | Select-Object Name, Enabled, LastLogon
Get-LocalGroup | Select-Object Name