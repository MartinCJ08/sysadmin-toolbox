<#
.SYNOPSIS
  Check-PackageUpdateStatus: list Windows updates
#>
if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
  Import-Module PSWindowsUpdate
  Get-WindowsUpdate -MicrosoftUpdate -ErrorAction SilentlyContinue
} else {
  'PSWindowsUpdate module not installed'
}