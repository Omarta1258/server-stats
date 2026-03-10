#!/bin/bash


echo "Main Menu"
echo "Choose"

#Total CPU usage

top -bn1 | grep "Cpu(s)"

cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')

cpu_used=$(echo "100 - $cpu_idle" | bc)

echo "CPU usage: $cpu_used%"

