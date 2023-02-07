!#/bin/bash

image=$(find ~/Pictures -type f | shuf | sxiv -fbtio)
feh --bg-scale $image
