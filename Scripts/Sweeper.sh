#!/bin/bash

## My network sweeper script
## Really only useful for /24 networks
## Will need to be run with sudo for some scan types
## An Alias to run nmap with sudo and changing sudoers file to not need password with nmap is handy

## Has two main dependencies:
## Nmap - Network mapper
## Rofi - Window switcher and program selector

## Selects the interface to be used in the scan
interface=$(ip -c=never -br -4 addr | rofi -dmenu -p "Which interface do you want to use?" | cut -d " " -f 1)

echo "Starting scan of network..."

## Creates temp files for speed and to save on read/writes
file=$(mktemp)

## Finds the IP address of current host and network ID
myip=$(ip -c=never -br -4 addr show dev $interface | awk '{print $3}' | cut -d '/' -f 1)
netid=$(ip -c=never -br -4 addr show dev $interface | awk '{print $3}' | cut -d '.' -f 1-3)

## The actual ping sweep
for ip in $(seq 1 254); do
    ping -c 1 -W 2 $netid.$ip | grep 'bytes from' | cut -d ' ' -f 4 | cut -d ':' -f 1 >> $file &
done

## Gives time for the sweep to do it's thing
sleep 3

## Makes a second temp file, removes host's IP address from list
file2=$(mktemp)
grep -v $myip $file | sort -V > $file2

## Allows for the selection of the IP and type of scan wanted
scan=$(cat $file2 | rofi -dmenu -p "What IP do you want to scan?")
scan_type=$(echo -e "1. Quick Scan\n2. Stealth Scan \n3. Full Scan" | rofi -dmenu -p "What type of scan do you want to do?" | cut -d '.' -f 1)
echo "Starting scan of $scan..."
if [[ $scan_type == "1" ]]; then
    nmap $scan -oX $scan.xml
elif [[ $scan_type == "2" ]]; then
    nmap -Pn -sS $scan -oX $scan.xml
elif [[ $scan_type == "3" ]]; then
    sudo nmap -T4 -A -O -sC -vvv $scan -oX $scan.xml
fi

## Converts the xml scan to html and cleans up unneeded files
xsltproc $scan.xml -o $scan.html
rm -f $scan.xml
rm $file
rm $file2
