# Ask the user for the directory path
$rootPath = Read-Host "Please enter the path to the main directory"

# Get the list of ZIP files within the current folder
$zipFiles = Get-ChildItem -Path $rootPath -File -Filter "*.zip"

# Iterate over each ZIP file
foreach ($zipFile in $zipFiles) {
    # Get the full path of the ZIP file
    $zipFilePath = $zipFile.FullName

    # Get the destination path to extract the ZIP file
    $destinationPath = Join-Path -Path $rootPath -ChildPath $zipFile.BaseName

    # Extract the ZIP file to the destination path
    try {
        Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath -Force
        Write-Host "Extracted ZIP file: $zipFilePath"
    }
    catch {
        Write-Error "Error extracting ZIP file: $zipFilePath. Error details: $_"
    }
}

Write-Host "ZIP file extraction completed."