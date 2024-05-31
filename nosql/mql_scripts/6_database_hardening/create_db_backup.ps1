$BackupDate = Get-Date -Format "yyyyMMdd"
$BackupTime = Get-Date -Format "HHmmss"

Set-Location C:\Backups\MongoDB

if (-not (Test-Path $BackupDate)) {
    New-Item -ItemType Directory -Path $BackupDate | Out-Null
}
Set-Location -Path $BackupDate

# Mongo dump
Invoke-Expression -Command "mongodump --quiet --config='C:\Tasksched\Creds\mongodump.yaml' --authenticationDatabase=admin --db=dtos --gzip --archive=dbbackup-$BackupTime.archive.gz"

# Encrypt Backups
Invoke-Expression -Command "gpg --sign --encrypt --batch --local-user '<CERT USED FOR SIGNING>' --recipient '<CERT USED FOR ENCRYPTION>' --output 'dbbackup-$BackupTime.archive.gz.gpg' dbbackup-$BackupTime.archive.gz"
Remove-Item "dbbackup-$BackupTime.archive.gz"