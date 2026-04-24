<#
.SYNOPSIS
  Check-BackupVerification: verify backup file checksum
.PARAMETER BackupFile
  Path to backup file
.PARAMETER ChecksumFile
  Path to checksum file (sha256)
#>
param(
  [Parameter(Mandatory=$true)]
  [string]$BackupFile,
  [Parameter(Mandatory=$true)]
  [string]$ChecksumFile
)

$expected = (Get-Content -Path $ChecksumFile | Select-Object -First 1).Split(' ')[0]
$actual = (Get-FileHash -Path $BackupFile -Algorithm SHA256).Hash

if ($expected -eq $actual) {
  'OK'
} else {
  'FAILED'
}