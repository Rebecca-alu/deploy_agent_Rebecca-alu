Attendance Tracker Deployment Agent
Here is the link to the video:
https://www.loom.com/share/115796144cbb4d35a440f4daa72736f8
Project Overview

This project is an automated deployment and bootstrapping system for a Student Attendance Tracker application using Bash scripting.

The purpose of the project is to demonstrate Infrastructure as Code (IaC) principles by automating:

* Project directory creation
* Configuration file generation
* Environment validation
* Dynamic configuration updates
* Process management using signal trapping

Instead of manually creating folders and files, the shell script performs the entire setup automatically in a few seconds.

⸻

Features

Automated Project Structure

The script automatically creates the following structure:

attendance_tracker_<project_name>/
│
├── Helpers/
│   ├── config.json
│   └── assets.csv
│
├── reports/
│   └── reports.log
│
└── attendance_checker.py

⸻

Dynamic Configuration

The user can customize:

* Warning threshold
* Failure threshold

The script uses the sed command to update values inside config.json automatically.

⸻

Process Management with Signal Trap

The project implements SIGINT handling using the trap command.

If the user presses:

CTRL + C

during execution, the script will:

1. Archive the current project directory
2. Create a .tar.gz backup
3. Remove the incomplete project folder
4. Exit safely

This prevents workspace clutter and incomplete deployments.

⸻

Environment Validation

The script checks if Python3 is installed using:

python3 --version

This ensures the environment is correctly configured before execution completes.

⸻

Technologies Used

* Bash Shell Scripting
* Linux Commands
* sed
* tar
* mkdir
* trap
* Python3 validation

⸻

How to Run the Project

1. Give Execute Permission

chmod +x setup_project.sh

⸻

2. Run the Script

./setup_project.sh

⸻

Example Execution

Enter project name: school_system
Enter warning threshold (default 75): 80
Enter failure threshold (default 50): 45

The script will automatically create:

attendance_tracker_school_system

with all required files and folders.

⸻

Health Checks

The script validates:

* Python3 installation
* Required directory structure
* Required configuration files

⸻

Signal Trap Demonstration

To test the archive feature:

1. Start the script
2. Press:

CTRL + C

The script will:

* Create an archive backup
* Remove incomplete files
* Exit safely

⸻

Learning Outcomes

This project demonstrates:

* Shell scripting fundamentals
* Linux process management
* Automation using Infrastructure as Code
* File manipulation and configuration
* Environment validation
* Error handling and cleanup

⸻

Author

Student Deployment Automation Project

Linux System Administration — Individual Summative Lab
