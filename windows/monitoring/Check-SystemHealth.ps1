<#
.SYNOPSIS
  Check-SystemHealth: quick health snapshot (CPU, memory, load, top processes)
#>
$time = Get-Date
$os = Get-CimInstance Win32_OperatingSystem

"Time: $time"
"UptimeHours: $([math]::Round((New-TimeSpan -Start $os.LastBootUpTime -End (Get-Date)).TotalHours,2))"

'CPU and Memory'
Get-Counter '\Processor(_Total)\% Processor Time','\Memory\Available MBytes' |
  Select-Object -ExpandProperty CounterSamples |
  Select-Object Path, CookedValue

'Top Processes (CPU)'
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 Name, Id, CPU, WorkingSet