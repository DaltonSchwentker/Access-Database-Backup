# Change the background color to black
$Host.UI.RawUI.BackgroundColor = "Black"
# Clear the console
Clear-Host

# Define the log file path
$logFilePath = Join-Path -Path $PSScriptRoot -ChildPath "backup-log.txt"

# Read the source and destination file paths from the config.txt file
$configFilePath = Join-Path -Path $PSScriptRoot -ChildPath "config.txt"
$config = Get-Content -Path $configFilePath | Where-Object { $_ -notmatch '^[#;]' }
$databasePath = ($config | Where-Object { $_ -match '^databasePath=' }).Split('=')[1]
$destinationPath = ($config | Where-Object { $_ -match '^destinationPath=' }).Split('=')[1]

# Get the original file name from the database path
$originalFileName = [System.IO.Path]::GetFileNameWithoutExtension($databasePath)

# Fetchs the current date (This is for naming the backup with the current date)
$dateString = (Get-Date).ToString('MM-dd-yyyy')

# Modify the destination path to include the date and original file name
$destinationPath = Join-Path -Path $destinationPath -ChildPath "$originalFileName as of $dateString.accdb"

# Print a separator line
Write-Host ('-' * 85) -ForegroundColor Cyan

Write-Host "Starting scheduled backup of $databasePath Access database..." -ForegroundColor Yellow

# Use Try/Catch for error handling
try {
    # Copy the source file to the destination path
    Copy-Item $databasePath $destinationPath

    Write-Host "Backup completed successfully.`nFile backed up to: $destinationPath." -ForegroundColor Green 
}
catch {
    Write-Host "An error occurred during the backup:`n$_" -ForegroundColor Red
}

# Print a separator line
Write-Host('-' * 85) -ForegroundColor Cyan

# Write the backup information to the log file
$backupInfo = "Source database path: $databasePath`nDestination path: $destinationPath`n Backup completed on: $(Get-Date -Format 'MM/dd/yyyy hh:mm:ss tt')`n"
Add-Content -Path $logFilePath -Value $backupInfo

# Wait for 5 seconds before ending the script
Start-Sleep -Seconds 5

Exit
