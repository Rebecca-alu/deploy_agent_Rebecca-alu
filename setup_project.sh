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

echo "Config file created"
