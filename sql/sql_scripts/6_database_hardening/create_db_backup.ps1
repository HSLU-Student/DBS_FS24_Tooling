$BackupDate = Get-Date -Format "yyyyMMdd"
$BackupTime = Get-Date -Format "HHmmss"

Set-Location C:\Backups\MySQL

if (-not (Test-Path $BackupDate)) {
    New-Item -ItemType Directory -Path $BackupDate | Out-Null
}
Set-Location -Path $BackupDate

# MySQL credentials
$Username = "<USERNAME>"

# MySQL dump
Invoke-Expression -Command "mysqldump --defaults-file='C:\Tasksched\Creds\.my.cnf' -u $Username --databases dtos --no-tablespaces --result-file=dbbackup-$BackupTime.sql" 

# Compress backup & delete .sql dump if compression succeeds
Invoke-Expression -Command "tar -czf dbbackup-$BackupTime.tar.bz2 ./dbbackup-$BackupTime.sql"
Remove-Item "dbbackup-$BackupTime.sql"

# Encrypt Backups
Invoke-Expression -Command "gpg --sign --encrypt --batch -r '<RECIPIENT>' --output 'dbbackup-$BackupTime.tar.bz2.gpg' dbbackup-$BackupTime.tar.bz2"
Remove-Item "dbbackup-$BackupTime.tar.bz2"