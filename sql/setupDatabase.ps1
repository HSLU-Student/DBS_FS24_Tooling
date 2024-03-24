Param(
    [switch]$AllActions,
    [switch]$InitTables,
    [switch]$LoadData,
    [switch]$AddConstraints
    )



# Read the content of .env file and set environment variables
Get-Content .env | ForEach-Object {
    $name, $value = $_.split('=')
    if (-not [string]::IsNullOrWhiteSpace($name) -and -not $name.Contains('#')) {
        Set-Item -Path "env:\$name" -Value $value
    }
}
$ROOT_PW = $env:ROOTPW
$DATABASE_NAME = $env:DATABASE_NAME
$MYSQL_SERVER_CONTAINER_NAME = $env:MYSQL_SERVER_CONTAINER_NAME



function Invoke-SQL-File {

    param (
        $FilePath
    )

    Write-Host "executing $FilePath" 
    Do{
        $out = docker exec -it $MYSQL_SERVER_CONTAINER_NAME bash -c "mysql -u root -p$ROOT_PW -D $DATABASE_NAME < $FilePath"
        Write-Host $out
        if($out -match "ERROR 2002"){
            Write-Host "Database not yet started correctly, retry in 10s"
            Start-Sleep 10
        }
    }while ($out -match "ERROR 2002") 
}




$stats= docker container ls -f name=$MYSQL_SERVER_CONTAINER_NAME
if ($stats -match $MYSQL_SERVER_CONTAINER_NAME) {
    Write-Host "Docker container already exists and is running, skipping compose..."
} else {
    Write-Host "Docker container not yet started...starting"
    docker compose up -d
    Start-Sleep 5
    Write-Host "Docker container started"
}

Start-Sleep 5

if($InitTables -or $AllActions){
#initialize tables
Write-Host "$("-"*25)`r`nInitializing tables`r`n$("-"*25)"

# create tables
$cd = "/var/lib/mysql-files/sql_scripts/noFKConstraints/"
$file = "artist.sql"
Invoke-SQL-File -FilePath "$cd$file"
$file = "format.sql"
Invoke-SQL-File -FilePath "$cd$file"
$file = "track.sql"
Invoke-SQL-File -FilePath "$cd$file"
$file = "release.sql"
Invoke-SQL-File -FilePath "$cd$file"
$file = "release_format.sql"
Invoke-SQL-File -FilePath "$cd$file"
$file = "track_artist.sql"
Invoke-SQL-File -FilePath "$cd$file"


Write-Host "$("-"*25)`r`nInitialized all tables`r`n$("-"*25)"

}else{
    Write-Host "$("-"*25)`r`nSkipped initializing tables`r`n$("-"*25)"
}

if($LoadData -or $AllActions){
# load data into tables
Write-Host "$("-"*25)`r`n load data into tables`r`n$("-"*25)"
$cd = "/var/lib/mysql-files/sql_scripts/loadData/"

$file = "format.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "artist.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "release.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "release_format.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "track.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "track_artist.sql"
Invoke-SQL-File -FilePath "$cd$file"

Write-Host "$("-"*25)`r`nData loaded into tables`r`n$("-"*25)"

}else{
    Write-Host "$("-"*25)`r`nSkipped loading data into tables`r`n$("-"*25)"
}

if($AddConstraints -or $AllActions){
# add constraints into tables
Write-Host "$("-"*25)`r`nAdd constraints to tables`r`n$("-"*25)"
$cd = "/var/lib/mysql-files/sql_scripts/constraints/"

$file = "track.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "release_format.sql"
Invoke-SQL-File -FilePath "$cd$file"

$file = "track_artist.sql"
Invoke-SQL-File -FilePath "$cd$file"

Write-Host "$("-"*25)`r`n All Constraints added`r`n$("-"*25)"

}else{
    Write-Host "$("-"*25)`r`nSkipped adding constraints`r`n$("-"*25)"
}
Write-Host "Script finished"


