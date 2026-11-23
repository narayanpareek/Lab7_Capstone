#!/bin/bash

show_cpu() {
    echo "----- CPU INFORMATION -----"
    uptime
    nproc
}

show_memory() {
    echo "----- MEMORY USAGE -----"
    free -h
}

show_disk() {
    echo "----- DISK USAGE -----"
    df -h
}

echo "===== SYSTEM MONITORING REPORT ====="

show_cpu
echo ""

show_memory
echo ""

show_disk

echo ""
echo "===== MONITORING COMPLETED ====="
