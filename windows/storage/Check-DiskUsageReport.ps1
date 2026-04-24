<#
.SYNOPSIS
  Check-DiskUsageReport: disk usage report
#>
Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, SizeRemaining, Size | Format-Table -AutoSize