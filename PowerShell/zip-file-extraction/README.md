# ZIP File Extraction Script

This PowerShell script allows you to extract multiple ZIP files from a specified directory. It provides a convenient way to automate the extraction process and handle any errors that may occur during the extraction.

## Usage

1. Run the script in a PowerShell environment.
2. When prompted, enter the path to the directory containing the ZIP files you want to extract.
3. The script will iterate over each ZIP file in the specified directory.
4. For each ZIP file, the script will extract its contents to a new folder with the same name as the ZIP file (without the .zip extension) in the same directory.
5. If the extraction is successful, the script will display a message indicating the ZIP file that was extracted.
6. If an error occurs during the extraction, the script will display an error message with details about the specific ZIP file and the error that occurred.
7. After processing all the ZIP files, the script will display a completion message.

## Requirements

- PowerShell v5.0 or later

## Notes

- Ensure that you have the necessary permissions to read and write files in the specified directory.
- If a ZIP file is password-protected, the script will not be able to extract its contents. In such cases, you will need to manually extract the ZIP file using the appropriate password.
- The script will overwrite any existing files in the destination folder if they have the same name as the extracted files.

## Troubleshooting

- If the script fails to extract a ZIP file, check the error message displayed for more information about the specific issue.
- Verify that you have the necessary permissions to access and modify files in the specified directory.
- Make sure that the ZIP files are not corrupted or incomplete. Try extracting them manually to ensure they are valid.

If you encounter any further issues or have questions, please contact the script author or refer to the PowerShell documentation for more information.