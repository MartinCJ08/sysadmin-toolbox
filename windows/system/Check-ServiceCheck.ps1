<#
.SYNOPSIS
  Check-ServiceCheck: service status check
.PARAMETER Name
  One or more service names
#>
param(
  [Parameter(Mandatory=$true, Position=0)]
  [string[]]$Name
)

foreach ($svc in $Name) {
  $s = Get-Service -Name $svc -ErrorAction SilentlyContinue
  if ($null -eq $s) {
    "${svc}: not found"
  } else {
    "${svc}: $($s.Status)"
  }
}