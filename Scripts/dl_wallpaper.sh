#!/bin/bash

path=$HOME/Pictures/
file_name=$(echo $0 | rev | cut -d "/" -f 1 | rev | cut -d '.' -f 1)
rsc=$(curl -Is $1 2> /dev/null | head -1 | cut -d " " -f 2 )
file_check=$(ls $path | grep -cEo $2'_[0-9]{4}x[0-9]{4}')
if [ $# -eq 0 ]; then
    >&2 echo "$file_name: No arguments given, two expected."
    >&2 echo "Expected useage: $file_name URL Name_of_file"
    exit
elif [ $# -eq 1 ]; then
    >&2 echo "$file_name: One argument given, two expected."
    >&2 echo "Expected useage: $file_name URL Name_of_file"
    exit
elif [ $# -gt 2 ]; then
    >&2 echo "$file_name: To many arguments given, two expected."
    >&2 echo "Expected useage: $file_name URL Name_of_file"
    >&2 echo "Do not use spaces to seperate words in a desired file name."
    exit
elif [ -z $rsc ]; then
    >&2 echo "$file_name: No URL given."
    >&2 echo "Ensure the first argument is a valid URL"
    exit
elif [ $(echo $rsc | cut -b 1) -ne 2 ]; then
    >&2 echo "$file_name: Error reaching URL."
    >&2 echo "HTTP Response Status Code: $rsc"
    exit
elif [ $file_check -gt 0 ]; then
    >&2 echo "$file_name: File name $2 already exists."
    exit
fi
t1=$(date +%s)
t2=$(date -d "$(clamscan --version | cut -d "/" -f 3)" +%s)
delta_t=$(( ($t1 - $t2) / 86400 ))
if [ $delta_t -gt 5 ]; then
    echo "Updating malware signatures..."
    sudo freshclam --quiet 2> /dev/null
else
    echo "Signatures up-to-date."
fi
echo "Downloading Image..."
wget -q -P /tmp $1
file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
echo "Scanning Image..."
is_safe=$(clamscan --quiet -i /tmp/$file)
if [ -z $is_safe ]; then
    echo "Image Safe."
else
    >&2 echo "Malware Found!" 
    rm /tmp/$file
    exit
fi
ext=$(echo $file | cut -d '.' -f 2)
name=$(echo $file | cut -d '.' -f 1)
if [ $ext != jpg ]; then
    echo "Converting Image to JPG..."
    convert /tmp/$file /tmp/$name.jpg
    rm /tmp/$file
fi
echo "Finishing up..."
res=$(file /tmp/$name.jpg | grep -Eo '[0-9]{4}(\s|)x(\s|)[0-9]{4}' | sed 's/\s//g')
mv /tmp/$name.jpg $path/$2_$res.jpg
echo "Done!"
