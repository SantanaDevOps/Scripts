# Run as administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Function to delete files and folders recursively
function Remove-FilesAndFolders {
    param(
        [string]$FolderPath
    )

    # Delete files in the folder
    Get-ChildItem -Path $FolderPath -File | ForEach-Object {
         try {
            $childItems = Get-ChildItem -Path $_.FullName -Recurse -ErrorAction SilentlyContinue
            if ($childItems) {
                Write-Host "Skipping folder with child items: $($_.FullName)"
            }
            else {
                Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
            }
        }
        catch {
            Write-Host "Unable to delete folder: $($_.FullName)"
        }
    }
}

# Delete files and folders in %temp%
$tempFolder = $env:TEMP
Write-Host "Deleting files and folders in %temp%..."
Remove-FilesAndFolders -FolderPath $tempFolder

# Delete files and folders in the current user's temp folder
$userTempFolder = Join-Path -Path $env:USERPROFILE -ChildPath "AppData\Local\Temp"
Write-Host "Deleting files and folders in the current user's temp folder..."
Remove-FilesAndFolders -FolderPath $userTempFolder

# Delete files and folders in the system-wide temp folder
$systemTempFolder = Join-Path -Path $env:WINDIR -ChildPath "Temp"
Write-Host "Deleting files and folders in the system-wide temp folder..."
Remove-FilesAndFolders -FolderPath $systemTempFolder

# Delete files and folders in the prefetch folder
$prefetchFolder = Join-Path -Path $env:WINDIR -ChildPath "Prefetch"
Write-Host "Deleting files and folders in the prefetch folder..."
Remove-FilesAndFolders -FolderPath $prefetchFolder

Write-Host "Executed successfully. Files and folders that could not be deleted have been skipped."

# Pause to view the result before closing the window
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")