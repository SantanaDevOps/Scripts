# Move Files and Remove Folders

This PowerShell script moves files from subfolders to the main directory and removes the empty subfolders.

## Description

The "File Moving and Folder Removing" script is designed to simplify the process of consolidating files from multiple subfolders into a single main directory. It prompts the user to enter the path of the main directory, iterates through each subfolder, moves all the files within those subfolders to the main directory, and then removes the empty subfolders.

## Prerequisites

- Windows operating system with PowerShell installed.

## Usage

1. Open PowerShell.
2. Navigate to the directory where the script is located.
3. Run the script by executing the following command:
.\file-moving-folder-removing.ps1
4. When prompted, enter the path of the main directory that contains the subfolders with files you want to consolidate.
5. Press Enter to start the process.
6. The script will move all the files from the subfolders to the main directory and remove the empty subfolders.
7. Once the process is completed, a message will be displayed indicating that the files have been moved and the empty folders have been removed.

## Example

Suppose you have a main directory called "Documents" with the following structure:
Documents/
├── Folder1/
│ ├── File1.txt
│ └── File2.txt
├── Folder2/
│ ├── File3.txt
│ └── File4.txt
└── Folder3/
├── File5.txt
└── File6.txt

After running the script and entering the path "C:\Documents" when prompted, the resulting directory structure will be:
Documents/
├── File1.txt
├── File2.txt
├── File3.txt
├── File4.txt
├── File5.txt
└── File6.txt

All the files from the subfolders will be moved to the main "Documents" directory, and the empty subfolders (Folder1, Folder2, and Folder3) will be removed.

## Notes

- The script requires PowerShell to be installed on the Windows operating system.
- Make sure you have the necessary permissions to modify the files and folders in the specified directory.
- The script moves the files and removes the empty folders permanently. Ensure that you have backed up your data before running the script.

