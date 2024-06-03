# Run as administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Function to delete files and folders recursively and return the count of deleted items
function Remove-FilesAndFolders {
    param(
        [string]$FolderPath
    )

    $deletedCount = 0

    # Delete files in the folder
    Get-ChildItem -Path $FolderPath -File | ForEach-Object {
        try {
            $childItems = Get-ChildItem -Path $_.FullName -Recurse -ErrorAction SilentlyContinue
            if ($childItems) {
                Write-Host "Skipping folder with child items: $($_.FullName)"
            } else {
                Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
                $deletedCount++
            }
        } catch {
            Write-Host "Unable to delete file: $($_.FullName)"
        }
    }

    # Delete folders in the folder
    Get-ChildItem -Path $FolderPath -Directory | ForEach-Object {
        try {
            Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
            $deletedCount++
        } catch {
            Write-Host "Unable to delete folder: $($_.FullName)"
        }
    }

    return $deletedCount
}

# Initialize total deleted count
$totalDeleted = 0

# Delete files and folders in %temp%
$tempFolder = $env:TEMP
Write-Host "Deleting files and folders in %temp%..."
$tempDeletedCount = Remove-FilesAndFolders -FolderPath $tempFolder
$totalDeleted += $tempDeletedCount

# Delete files and folders in the current user's temp folder
$userTempFolder = Join-Path -Path $env:USERPROFILE -ChildPath "AppData\Local\Temp"
Write-Host "Deleting files and folders in the current user's temp folder..."
$userTempDeletedCount = Remove-FilesAndFolders -FolderPath $userTempFolder
$totalDeleted += $userTempDeletedCount

# Delete files and folders in the system-wide temp folder
$systemTempFolder = Join-Path -Path $env:WINDIR -ChildPath "Temp"
Write-Host "Deleting files and folders in the system-wide temp folder..."
$systemTempDeletedCount = Remove-FilesAndFolders -FolderPath $systemTempFolder
$totalDeleted += $systemTempDeletedCount

# Delete files and folders in the prefetch folder
$prefetchFolder = Join-Path -Path $env:WINDIR -ChildPath "Prefetch"
Write-Host "Deleting files and folders in the prefetch folder..."
$prefetchDeletedCount = Remove-FilesAndFolders -FolderPath $prefetchFolder
$totalDeleted += $prefetchDeletedCount

# Print summary of deleted counts
Write-Host "Execution completed. Summary of deleted files and folders:"
Write-Host "Deleted $tempDeletedCount files and folders in %temp%."
Write-Host "Deleted $userTempDeletedCount files and folders in the current user's temp folder."
Write-Host "Deleted $systemTempDeletedCount files and folders in the system-wide temp folder."
Write-Host "Deleted $prefetchDeletedCount files and folders in the prefetch folder."
Write-Host "Total deleted files and folders: $totalDeleted"

# Pause to view the result before closing the window
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")