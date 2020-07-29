#!/bin/bash
filename='instaled-extensions.md'
n=1
while read line; do
# reading each line
command $line
n=$((n+1))
done < $filename
