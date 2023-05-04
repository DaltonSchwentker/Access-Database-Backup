<div style="float: left; margin-right: 10px;">
  <img src="databaseImage.png" width="150">
</div>

# Backup Access Database Script
This is a simple PowerShell script to backup an Access database to a specified location, and write a log of the backup history. The script reads the source and destination file paths from a configuration file, and uses the current date to name the backup file.

## Getting Started
To use this script, you'll need to do the following:

## Clone the repository to your local machine.
Make sure you have PowerShell installed on your machine.
Modify the config.txt file to specify the path to the database you want to backup, and the destination path where the backup file should be saved.
By default, the log file will output in the same directory as the script. Modify the script to specify the log file path if you would like it to be different.
Test the script to make sure it is working correctly.

## Usage
Once you've configured the script and tested it, you can use it in a number of ways:

- Manually: Open PowerShell and navigate to the script directory, then run the script using the .\backup_access_db.ps1 command.
- Scheduled task: Use Windows Task Scheduler to run the script on a schedule. Set the program/script field to PowerShell.exe, and the arguments field to -ExecutionPolicy Bypass -File "path\to\backup_access_db.ps1". Make sure you also set the start in directory to the script directory.

## Configuration
The config.txt file contains the following settings:
- databasePath: The path to the Access database you want to backup.
- destinationPath: The path to the folder where you want to save the backup file.

<div style="float: left; margin-right: 10px;">
  <img src="config example.png" width="700">
</div>

Here is an example of how to use the script to backup your Access database...

## Log File
The script writes a log file to track the backup history. The log file path is specified in the script, and each backup is recorded in the file with the following information:
- Source database path
- Destination path
- Date and time of backup

## Contributing
Contributions are welcome! If you find a bug or have an idea for a new feature, please open an issue or submit a pull request.
