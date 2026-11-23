#!/bin/bash

while true
do
    echo ""
    echo "===== LINUX ADMINISTRATION TOOLKIT ====="
    echo "1. System Monitoring Report"
    echo "2. Run Backup"
    echo "3. Analyze Logs"
    echo "4. Full Status Report"
    echo "5. Exit"
    echo "========================================"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            ./monitor.sh
            ;;
        2)
            read -p "Enter source directory: " source
            read -p "Enter destination directory: " destination
            ./backup.sh "$source" "$destination"
            ;;
        3)
            read -p "Enter log file path: " logfile
            ./log_analyzer.sh "$logfile"
            ;;
        4)
            ./monitor.sh
            ./log_analyzer.sh sample_logs/*.log
            ;;
        5)
            echo "Exiting toolkit"
            break
            ;;
        *)
            echo "Invalid choice. Please select 1 to 5."
            ;;
    esac
done
