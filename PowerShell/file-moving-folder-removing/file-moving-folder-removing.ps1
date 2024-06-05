# Prompt the user for the path of the main directory
$rootPath = Read-Host "Please enter the path of the main directory "

# Get the list of folders within the main directory
$folders = Get-ChildItem -Path $rootPath -Directory

# Iterate through each folder
foreach ($folder in $folders) {
    # Get the list of files within the current folder
    $files = Get-ChildItem -Path $folder.FullName -File

    # Move each file to the main directory
    foreach ($file in $files) {
        Move-Item -Path $file.FullName -Destination $rootPath
    }

    # Remove the empty folder
    Remove-Item -Path $folder.FullName
}

Write-Host "Process completed. The files have been moved to the main directory, and the empty folders have been removed."