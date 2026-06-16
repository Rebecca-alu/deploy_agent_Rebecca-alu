#!/bin/bash

read -p "Enter project name: " name

project_dir="attendance_tracker_$name"

cleanup() {

    echo ""
    echo "Ctrl+C detected"

    if [ -d "$project_dir" ]; then
        tar -czf "${project_dir}_archive.tar.gz" "$project_dir"
        rm -rf "$project_dir"

        echo "Archive created"
        echo "Incomplete directory deleted"
    fi

    exit 1
}

trap cleanup SIGINT

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

touch "$project_dir/reports/reports.log"

read -p "Enter warning threshold (75): " warning
read -p "Enter failure threshold (50): " failure

if [[ "$warning" =~ ^[0-9]+$ ]]; then
    sed -i.bak "s/\"warning\": 75/\"warning\": $warning/" "$project_dir/Helpers/config.json"
fi

if [[ "$failure" =~ ^[0-9]+$ ]]; then
    sed -i.bak "s/\"failure\": 50/\"failure\": $failure/" "$project_dir/Helpers/config.json"
fi

rm -f "$project_dir/Helpers/config.json.bak"

echo ""
echo "Checking Python installation..."

if python3 --version > /dev/null 2>&1
then
    echo "Python3 is installed"
else
    echo "Python3 is not installed"
fi

echo ""
echo "Checking project structure..."

if [ -f "$project_dir/Helpers/config.json" ] &&
   [ -f "$project_dir/Helpers/assets.csv" ] &&
   [ -f "$project_dir/reports/reports.log" ]
then
    echo "Project structure is correct"
else
    echo "Project structure is incomplete"
fi

echo ""
echo "Setup completed"
