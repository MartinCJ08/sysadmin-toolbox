<#
.SYNOPSIS
  Check-InventoryExport: basic hardware/software inventory
#>
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$bios = Get-CimInstance Win32_BIOS

"host,os,version,cpu,bios_serial"
"$env:COMPUTERNAME,$($os.Caption),$($os.Version),$($cpu.Name),$($bios.SerialNumber)"