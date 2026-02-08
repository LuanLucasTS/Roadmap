#!/bin/bash

# Script to analyze basic server performance stats

echo "Server Performance Stats"
echo "------------------------"

# OS Version
echo "OS Version:"
uname -a
echo ""

# Uptime and Load Average
echo "Uptime and Load Average:"
uptime
echo ""

# Logged in Users
echo "Logged in Users:"
who
echo ""

# Failed Login Attempts (assuming common log location; may vary by distro)
echo "Recent Failed Login Attempts:"
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | tail -n 10
elif [ -f /var/log/secure ]; then
    grep "Failed password" /var/log/secure | tail -n 10
else
    echo "Log file not found (/var/log/auth.log or /var/log/secure)"
fi
echo ""

# Total CPU Usage
echo "Total CPU Usage:"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print $1}')
cpu_usage=$(echo "100 - $cpu_idle" | bc)
echo "CPU Usage: $cpu_usage%"
echo ""

# Total Memory Usage
echo "Total Memory Usage:"
free_output=$(free -m)
total_mem=$(echo "$free_output" | grep Mem: | awk '{print $2}')
used_mem=$(echo "$free_output" | grep Mem: | awk '{print $3}')
free_mem=$(echo "$free_output" | grep Mem: | awk '{print $4}')
mem_percent=$(echo "scale=2; ($used_mem / $total_mem) * 100" | bc)
echo "Total: ${total_mem}MB"
echo "Used: ${used_mem}MB (${mem_percent}%)"
echo "Free: ${free_mem}MB"
echo ""

# Total Disk Usage (for all filesystems)
echo "Total Disk Usage:"
df_output=$(df -m --total | tail -1)
total_disk=$(echo "$df_output" | awk '{print $2}')
used_disk=$(echo "$df_output" | awk '{print $3}')
free_disk=$(echo "$df_output" | awk '{print $4}')
disk_percent=$(echo "$df_output" | awk '{print $5}' | sed 's/%//')
echo "Total: ${total_disk}MB"
echo "Used: ${used_disk}MB (${disk_percent}%)"
echo "Free: ${free_disk}MB"
echo ""

# Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps aux --sort=-%cpu | head -n 6
echo ""

# Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps aux --sort=-%mem | head -n 6
echo ""
