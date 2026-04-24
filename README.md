# Sysadmin Toolbox

A growing collection of Linux and Windows admin scripts organized by function and platform.

## Structure

- `linux/` Linux shell scripts
- `windows/` Windows PowerShell scripts
- `docs/` Usage and parameters
- `config/` Target definitions and environment settings
- `output/` Generated reports
- `logs/` Script execution logs
- `tests/` Validation and dry-run checks

Categories (both `linux/` and `windows/`):

- `system/`
- `network/`
- `security/`
- `storage/`
- `users/`
- `backup/`
- `monitoring/`
- `inventory/`
- `maintenance/`
- `automation/`

## Examples

Linux

```bash
bash ./toolbox system summary
./toolbox system summary
./toolbox monitoring health
bash linux/system/check-host-summary.sh
bash linux/system/check-service-check.sh sshd
bash linux/network/check-network-connectivity.sh 1.1.1.1 example.com
```

Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File .\toolbox.ps1 system summary
powershell -ExecutionPolicy Bypass -File .\toolbox.ps1 monitoring health
powershell -ExecutionPolicy Bypass -File windows/system/Check-HostSummary.ps1
powershell -ExecutionPolicy Bypass -File windows/system/Check-ServiceCheck.ps1 -Name Spooler, W32Time
powershell -ExecutionPolicy Bypass -File windows/network/Check-NetworkConnectivity.ps1 -Host 1.1.1.1 -Dns example.com
```

## Notes

- Linux scripts are plain `bash`. If you need executable bits, run `chmod +x linux/**/*.sh` on a Linux host.
- Windows update status uses the `PSWindowsUpdate` module if installed.

## Next Step

Add a unified launcher script so you can run commands like:

```
toolbox system summary
```
