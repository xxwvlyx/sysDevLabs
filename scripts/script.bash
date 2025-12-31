#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "You are not root." >&2
    exit 1
fi

echo "Hello, root"


DEST=/home/vboxuser/Desktop/copyfileEtc
mkdir -p "$DEST"


FILES=$(find /etc -maxdepth 1 -type f)


for f in $FILES; do
    cp "$f" "$DEST"
done


count=$(echo "$FILES" | wc -l)

echo "Number of regular files in /etc: $count"

