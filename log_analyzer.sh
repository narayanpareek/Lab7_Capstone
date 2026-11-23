#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: ./log_analyzer.sh log_file"
    exit 1
fi

for FILE in "$@"
do
    if [ ! -f "$FILE" ]; then
        echo "Error: File not found: $FILE"
        continue
    fi

    echo "===== LOG ANALYSIS: $FILE ====="

    ERRORS=$(grep -ic "ERROR" "$FILE")
    WARNINGS=$(grep -ic "WARNING" "$FILE")

    echo "Total Errors: $ERRORS"
    echo "Total Warnings: $WARNINGS"

    echo ""
    echo "Error Details:"
    grep -i "ERROR" "$FILE" || echo "No errors found"

    echo ""
done
