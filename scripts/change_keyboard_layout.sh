#! /bin/bash

CURRENT_LAYOUT=$(setxkbmap -query|awk -F : 'NR==3{print $2}'|sed 's/ //g')

if [ "$CURRENT_LAYOUT" = "us" ]; then
    setxkbmap -model abnt2 -layout br -variant abnt2
else
    setxkbmap "us"
fi
