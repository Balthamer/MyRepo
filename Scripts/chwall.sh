#!/bin/bash

cp $1 ~/.config/wall.jpg
xwallpaper --zoom $1
wal -a 80 -qi $1
