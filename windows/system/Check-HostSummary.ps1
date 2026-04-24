<#
.SYNOPSIS
  Check-HostSummary: basic host summary
#>
$os = (Get-CimInstance -ClassName Win32_OperatingSystem)
$cpu = (Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1)
$ip = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object { $_.IPAddress -notlike '169.254*' }

"Host Summary"
"Host: $env:COMPUTERNAME"
"OS: $($os.Caption)"
"Kernel: $($os.Version)"
"Uptime: $([math]::Round((New-TimeSpan -Start $os.LastBootUpTime -End (Get-Date)).TotalHours,2)) hours"
"IPs: $($ip.IPAddress -join ',')"
"CPU: $($cpu.Name)"
"Memory: $([math]::Round($os.TotalVisibleMemorySize/1MB,2)) GB total"