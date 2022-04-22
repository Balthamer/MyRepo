#!/bin/bash

# for i in $(ls -1 | grep -v .sh); do file $i | echo -e "$i $(file $i | grep -Eo '[0-9]{4,5}(\s|)x(\s|)[0-9]{4,5}' | sed 's/\s//g')"; done

for i in $(ls -1 | grep -E '.png|.jpg' | grep -Ev '[0-9]{4}x[0-9]{4}'); do
    file=$(echo $i | cut -d '.' -f 1)
    ext=$(echo $i | cut -d '.' -f 2)
    res=$(file $i | grep -Eo '[0-9]{4}(\s|)x(\s|)[0-9]{4}' | sed 's/\s//g')
    name=$(echo "${file}_${res}.$ext")
    mv $i $name
done    
