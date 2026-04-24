<#
.SYNOPSIS
  Check-SecurityBasics: quick security posture checks
#>
$firewall = Get-NetFirewallProfile | Select-Object Name, Enabled
$uac = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name EnableLUA -ErrorAction SilentlyContinue

'Firewall Profiles'
$firewall | Format-Table -AutoSize

'UAC Enabled'
if ($null -ne $uac) { $uac.EnableLUA } else { 'Unknown' }