#!/bin/bash
 
LOG_FILE="/home/ubuntu/Myserver_logs.log"

echo "===Cheking system Health====" | tee -a $LOG_FILE
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk '/Mem:/ { printf("%.2f"), $3/$2*100 }')
DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//g')
 
echo "CPU Usage: $CPU%" | tee -a $LOG_FILE
echo "Memory Usage: $MEM%" | tee -a $LOG_FILE
echo "Disk Usage: $DISK%" | tee -a $LOG_FILE
 
if (( ${CPU%.*} > 80 )); then echo "ALERT: CPU usage getting exceeded 80% !" | tee -a $LOG_FILE; fi
if (( ${MEM%.*} > 80 )); then echo "ALERT:  Memory usage getting exceeded 80%!" | tee -a $LOG_FILE; fi
if (( $DISK > 80 )); then echo "ALERT: Disk space running low!===Exceeded 80% Usage" | tee -a $LOG_FILE; fi
