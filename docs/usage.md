# Usage

## Conventions

- Linux scripts: `bash linux/<category>/<script>.sh`
- Windows scripts: `powershell -ExecutionPolicy Bypass -File windows\<category>\<Script>.ps1`
- Launcher: `./toolbox <category> <command> [args...]` or `powershell -ExecutionPolicy Bypass -File .\toolbox.ps1 <category> <command> [args...]`

## Launcher Examples

Linux:

```bash
./toolbox system summary
./toolbox network check 1.1.1.1 example.com
./toolbox security audit
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\toolbox.ps1 system summary
powershell -ExecutionPolicy Bypass -File .\toolbox.ps1 network check -Host 1.1.1.1 -Dns example.com
powershell -ExecutionPolicy Bypass -File .\toolbox.ps1 security audit
```

## Parameters and Examples

### Check-HostSummary

Linux:

```bash
bash linux/system/check-host-summary.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/system/Check-HostSummary.ps1
```

### Check-DiskUsageReport

Linux:

```bash
bash linux/storage/check-disk-usage-report.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/storage/Check-DiskUsageReport.ps1
```

### Check-ServiceCheck

Linux:

```bash
bash linux/system/check-service-check.sh sshd
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/system/Check-ServiceCheck.ps1 -Name Spooler
```

### Check-LogErrorScan

Linux:

```bash
bash linux/maintenance/check-log-error-scan.sh /var/log/syslog
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/maintenance/Check-LogErrorScan.ps1 -LogName System
```

### Check-NetworkConnectivity

Linux:

```bash
bash linux/network/check-network-connectivity.sh 1.1.1.1 example.com
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/network/Check-NetworkConnectivity.ps1 -Host 1.1.1.1 -Dns example.com
```

### Check-UserGroupAudit

Linux:

```bash
bash linux/users/check-user-group-audit.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/users/Check-UserGroupAudit.ps1
```

### Check-BackupVerification

Linux:

```bash
bash linux/backup/check-backup-verification.sh /backups/app.tgz /backups/app.tgz.sha256
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/backup/Check-BackupVerification.ps1 -BackupFile C:\backups\app.zip -ChecksumFile C:\backups\app.zip.sha256
```

### Check-PackageUpdateStatus

Linux:

```bash
bash linux/system/check-package-update-status.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/system/Check-PackageUpdateStatus.ps1
```

### Check-SystemHealth

Linux:

```bash
bash linux/monitoring/check-system-health.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/monitoring/Check-SystemHealth.ps1
```

### Check-SecurityBasics

Linux:

```bash
bash linux/security/check-security-basics.sh
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/security/Check-SecurityBasics.ps1
```

### Check-InventoryExport

Linux:

```bash
bash linux/inventory/check-inventory-export.sh > output/inventory.csv
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File windows/inventory/Check-InventoryExport.ps1 > output\inventory.csv
```
