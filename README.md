# Attendance Tracker Deployment Agent

## Project Summary

For this project, I created a Bash shell script that automates the setup of a Student Attendance Tracker. The goal was to avoid manually creating folders and files every time the project needs to be deployed. By running a single script, the entire project structure is created automatically, making the setup process faster and more efficient.

The script also allows the user to update attendance warning and failure thresholds through terminal input. These values are then updated in the configuration file using the `sed` command. In addition, the script performs a health check to confirm that Python 3 is installed and verifies that all required files and directories have been created successfully.

Another important feature of the project is signal handling. If the user interrupts the script using `Ctrl + C`, the script catches the signal, creates an archive of the current project state, and removes the incomplete project directory. This helps prevent unnecessary files from being left behind and keeps the workspace organized.

This project helped me practice shell scripting concepts such as file and directory management, user input handling, stream editing, process management, and environment validation.

## How to Run

```bash
chmod +x setup_project.sh
./setup_project.sh
```

## Archive Feature

To test the archive feature, run the script and press `Ctrl + C` before it finishes executing. The script will:

1. Create an archive of the current project.
2. Remove the incomplete project directory.
3. Exit safely after displaying a message.

