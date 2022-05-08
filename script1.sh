#! /bin/bash

read -p "Name of service: " servnm
status=$(systemctl status $servnm)
echo "${status}"

line=$(echo "${status}" | grep 'Active: ')
inactive=$(echo "${line}" | grep 'inactive')
if [ -n "$inactive" ]; then
	systemctl enable $servnm
	echo 'Service is enabled'
else
	echo 'Service already works'
fi
