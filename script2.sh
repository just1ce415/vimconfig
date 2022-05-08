#! /bin/bash

echo "Version details" > output
cat /etc/os-release >> output

echo "" >> output
echo "Network interfaces" >> output
echo "$(ip addr)" >> output

echo "" >> output
echo "Firewall configuration" >> output
echo "$(sudo iptables -L -n -v)" >> output


echo "" >> output
echo "Sudoers" >> output
sudo cat /etc/sudoers >> output
