#!/bin/bash
if [ "$EUID" -ne 0 ]; then
	echo "You are not root." >&2
	exit 1
fi 
echo "Hello, root"
count=$(find /etc -type f | wc -l)
echo "Number of regular files in /etc: $count"
