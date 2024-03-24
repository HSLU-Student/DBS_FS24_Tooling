# Define the folder path
$folderPath = "./load_data/table_data"

# Create the folder if it doesn't exist
if (-not (Test-Path -Path $folderPath -PathType Container)) {
    New-Item -Path $folderPath -ItemType Directory | Out-Null
}

# Read the CSV file containing filename, local path or URL, skipping the header row
$csvFile = "./table_data.csv"
$csvData = Import-Csv -Path $csvFile | Select-Object -Skip 0


# Iterate through each row in the CSV
foreach ($row in $csvData) {
    $filename = $row.filename
    $source = $row.source
    $filePath = Join-Path -Path $folderPath -ChildPath $filename
    Write-Host "File Path: $filePath"


    # Check if file already exists, if not download or copy it
    if (-not (Test-Path -Path $filePath -PathType Leaf)) {
        Write-Host "Processing $filename..."
        try {
            if ($source -like "http*" -or $source -like "ftp*") {
                # File is a URL, download it
                Write-Host "Downloading from $source..."
                Invoke-WebRequest -Uri $source -OutFile $filePath
                Write-Host "$filename downloaded successfully."
            }
            else {
                # File is a local path, copy it
                Copy-Item -Path $source -Destination $filePath -Force
                Write-Host "$filename copied successfully."
            }
        }
        catch {
            Write-Host "Error processing $filename from $filePath"
        }
    }
    else {
        Write-Host "$filename already exists. Skipping."
    }
}

