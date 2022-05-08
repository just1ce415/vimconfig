#! /bin/bash

echo "Uptime" > workstation_log
echo "$(uptime)" >> workstation_log

echo "" >> workstation_log
echo "Logged users" >> workstation_log
echo "$(w)" >> workstation_log

echo "" >> workstation_log
echo "Last logins" >> workstation_log
echo "$(last)" >> workstation_log

echo "" >> workstation_log
echo "Top 10 processes by memory usage" >> workstation_log
echo "$(ps -aux --sort -%mem | head -10)" >> workstation_log

echo "" >> workstation_log
echo "Opened TCP & UDP ports" >> workstation_log
echo "$(netstat -atu)" >> workstation_log

echo "" >> workstation_log
echo "Virtual memory usage" >> workstation_log
echo "$(free -t)" >> workstation_log

echo "" >> workstation_log
echo "Disc space usage" >> workstation_log
echo "$(df -h)" >> workstation_log
