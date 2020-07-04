#!/bin/bash
set -e

FILE=/etc/diamond/diamond.conf.j2
OUTPUT_FILE=/etc/diamond/diamond.conf

if test -f "$FILE"; then
    echo "$FILE exists."
    j2 "$FILE" -o "$OUTPUT_FILE"
    rm "$FILE"
fi

diamond -f -l --skip-pidfile --skip-fork