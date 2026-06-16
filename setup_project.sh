#!/bin/bash

read -p "Enter project name: " name

project_dir="attendance_tracker_$name"

mkdir -p "$project_dir/Helpers"
mkdir -p "$project_dir/reports"

cat > "$project_dir/Helpers/config.json" << EOF2
{
    "thresholds": {
        "warning": 75,
        "failure": 50
    },
    "run_mode": "live",
    "total_sessions": 15
}
EOF2

cat > "$project_dir/Helpers/assets.csv" << EOF2
Email,Names,Attendance Count,Absence Count
alice@example.com,Alice Johnson,14,1
bob@example.com,Bob Smith,7,8
charlie@example.com,Charlie Davis,4,11
diana@example.com,Diana Prince,15,0
EOF2

echo "Files created"
