#!/bin/bash
echo "Staging, committing, and pushing all repositories..."

BASE="$(pwd)"  # assumes you run the script inside ~/Documents/GitHub

for dir in "$BASE"/*; do
    if [ -d "$dir/.git" ]; then
        cd "$dir" || continue
        # Check for any changes
        if ! git diff --quiet || ! git diff --cached --quiet; then
            git add .
            git commit -m "Auto-update: staged changes"
            git push
            echo "Pushed changes in $dir"
        else
            echo "No changes to push in $dir"
        fi
    fi
done

echo "All done!"
