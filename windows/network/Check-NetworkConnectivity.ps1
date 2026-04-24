<#
.SYNOPSIS
  Check-NetworkConnectivity: ping and DNS check
.PARAMETER Host
  Host to ping
.PARAMETER Dns
  DNS name to resolve
#>
param(
  [string]$Host = '8.8.8.8',
  [string]$Dns = 'www.example.com'
)

Test-Connection -ComputerName $Host -Count 4
Resolve-DnsName -Name $Dns -ErrorAction SilentlyContinue