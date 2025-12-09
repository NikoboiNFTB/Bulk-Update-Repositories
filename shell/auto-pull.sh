#!/usr/bin/env bash
set -e

for d in */; do
    if [ -d "$d/.git" ]; then
        echo ">>> $d"
        git -C "$d" pull &
    fi
done

wait
