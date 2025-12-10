#!/bin/bash

for d in */; do
    if [ -d "$d/.git" ]; then
        echo "=== $d ==="
        (
            cd "$d" || exit
            git add .
            git commit -m "Automated push"
            git push
        )
        echo
    else
        echo "Skipping $d (not a git repo)"
    fi
done
