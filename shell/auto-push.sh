#!/usr/bin/env bash
set -e

for d in */; do
    if [ -d "$d/.git" ]; then
        echo ">>> $d"
        (
            git -C "$d" add .
            git -C "$d" commit -m "Automated update" || true
            git -C "$d" push
        ) &
    fi
done

wait
