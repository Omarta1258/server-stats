#!/bin/bash


#Total CPU usage
echo "=================="
echo "Total CPU usage:"

top -bn1 | grep "Cpu(s)"

cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')

cpu_used=$(echo "100 - $cpu_idle" | bc)

echo "CPU usage: $cpu_used%"


echo "=================="

echo "Memory usage"
mem_total=$(free -h | awk '/^Mem/ {print $2}')
mem_used=$(free -h | awk '/^Mem/ {print $3}')
mem_free=$(free -h | awk '/^Mem/ {print $4}')

mem_total_mb=$(free -m | awk '/^Mem/ {print $2}')
mem_used_mb=$(free -m | awk '/^Mem/ {print $3}')

mem_percent=$(echo "scale=1; $mem_used_mb * 100 / $mem_total_mb" | bc)

echo "Total: $mem_total"
echo "Used: $mem_used ($mem_percent%)"
echo "Free: $mem_free"


echo "=================="

echo "Disk Usage"

disk_total=$(df -h | awk '$NF=="/" {print $2}')
disk_used=$(df -h | awk '$NF=="/" {print $3}')
disk_free=$(df -h | awk '$NF=="/" {print $4}')
disk_percent=$(df -h | awk '$NF=="/" {print $5}')

echo "Total: $disk_total"
echo "Used: $disk_used ($disk_percent)"
echo "Free: $disk_free"

echo "=================="
