
#!/bin/bash

read -p "Enter project name: " name

project_dir="attendance_tracker_$name"

mkdir -p "$project_dir/Helpers"

mkdir -p "$project_dir/reports"

echo "Folders created"

