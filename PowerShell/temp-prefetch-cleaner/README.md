# Temp and Prefetch Cleaner

This PowerShell script allows you to clean up the %temp%, user's temp, and prefetch folders on your Windows system. It removes files and folders recursively, skipping any files or folders that are in use or cannot be deleted.

## Prerequisites

- Windows operating system
- PowerShell execution policy set to allow running scripts

## Usage

1. Download the `TempAndPrefetchCleaner.ps1` script.

2. Open PowerShell as an administrator.

3. Navigate to the directory where the script is located.

4. Run the script by executing the following command: `.\TempAndPrefetchCleaner.ps1`.
  
5. The script will attempt to delete files and folders in the following locations:
- %temp% folder
- User's temp folder (AppData\Local\Temp)
- Prefetch folder

6. If any files or folders cannot be deleted, a message will be displayed indicating the specific file or folder that could not be removed. Afterwards, the script will continue with the next item.

7. Once the script finishes executing, a success message will be displayed, along with a note indicating that any files or folders that could not be deleted have been skipped.

8. Press any key to exit the script.

## Notes

- This script requires administrative privileges to run. Regarding this, it will automatically attempt to run as an administrator if not already running with elevated privileges.

- The script recursively deletes files and folders in the specified locations. Please exercise caution and ensure that you understand the script's functionality before running it in your environment.

- If a file or folder is in use or cannot be deleted for any reason, the script will skip it and continue with the next item. Thus, it will not interrupt the overall execution flow.

- The script provides a pause at the end to allow you to view the results before the window closes; you need to press any key to exit the script.

