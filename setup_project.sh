#!/bin/bash

read -p "Enter project name: " name

project_dir="attendance_tracker_$name"

cleanup() {
    echo ""
    echo "=================================="
    echo "CTRL + C detected (Interrupt)"
    echo "=================================="

    if [ -d "$project_dir" ]; then
        tar -czf "${project_dir}_archive.tar.gz" "$project_dir"
        rm -rf "$project_dir"
        echo "Archive created: ${project_dir}_archive.tar.gz"
        echo "Incomplete project removed"
    fi

    exit 1
}

trap cleanup SIGINT

echo "=================================="
echo "Attendance Tracker Project Setup"
echo "=================================="

mkdir -p "$project_dir/Helpers"
mkdir -p "$project_dir/reports"

cat > "$project_dir/Helpers/config.json" << EOF
{
    "thresholds": {
        "warning": 75,
        "failure": 50
    },
    "run_mode": "live",
    "total_sessions": 15
}
EOF

cat > "$project_dir/Helpers/assets.csv" << EOF
Email,Names,Attendance Count,Absence Count
alice@example.com,Alice Johnson,14,1
bob@example.com,Bob Smith,7,8
charlie@example.com,Charlie Davis,4,11
diana@example.com,Diana Prince,15,0
EOF

touch "$project_dir/reports/reports.log"

echo ""
echo "---- Threshold Configuration ----"

read -p "Enter warning threshold (default 75): " warning
read -p "Enter failure threshold (default 50): " failure

if [[ "$warning" =~ ^[0-9]+$ ]]; then
    sed -i.bak "s/\"warning\": 75/\"warning\": $warning/" "$project_dir/Helpers/config.json"
fi

if [[ "$failure" =~ ^[0-9]+$ ]]; then
    sed -i.bak "s/\"failure\": 50/\"failure\": $failure/" "$project_dir/Helpers/config.json"
fi

rm -f "$project_dir/Helpers/config.json.bak"

echo ""
echo "---- Environment Check ----"

if python3 --version > /dev/null 2>&1; then
    echo "Python3: Available"
else
    echo "Python3: Not installed"
fi

echo ""
echo "---- Structure Validation ----"

if [ -f "$project_dir/Helpers/config.json" ] &&
   [ -f "$project_dir/Helpers/assets.csv" ] &&
   [ -f "$project_dir/reports/reports.log" ]; then
    echo "Project structure: OK"
else
    echo "Project structure: FAILED"
fi

echo ""
echo "=================================="
echo "Setup Completed Successfully"
echo "=================================="
