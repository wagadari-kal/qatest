#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80     # CPU usage threshold (%)
MEM_THRESHOLD=80     # Memory usage threshold (%)
DISK_THRESHOLD=80    # Disk usage threshold (%)

# Function to check CPU usage
check_cpu_usage() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        echo "$(date +'%Y-%m-%d %H:%M:%S') - High CPU usage detected: $cpu_usage%" >> /var/log/system_health.log
    fi
}

# Function to check memory usage
check_memory_usage() {
    local memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$memory_usage > $MEM_THRESHOLD" | bc -l) )); then
        echo "$(date +'%Y-%m-%d %H:%M:%S') - High memory usage detected: $memory_usage%" >> /var/log/system_health.log
    fi
}

# Function to check disk usage
check_disk_usage() {
    local disk_usage=$(df -h / | awk '/\// {print $(NF-1)}' | sed 's/%//')
    if (( $disk_usage > $DISK_THRESHOLD )); then
        echo "$(date +'%Y-%m-%d %H:%M:%S') - High disk usage detected: $disk_usage%" >> /var/log/system_health.log
    fi
}

# Function to check number of running processes
check_running_processes() {
    local process_count=$(ps aux | wc -l)
    if (( $process_count > 200 )); then  # Adjust the threshold as needed
        echo "$(date +'%Y-%m-%d %H:%M:%S') - High number of running processes detected: $process_count" >> /var/log/system_health.log
    fi
}

# Main function to call all checks
main() {
    check_cpu_usage
    check_memory_usage
    check_disk_usage
    check_running_processes
}

# Run the main function
main

