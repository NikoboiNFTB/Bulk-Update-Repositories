#!/bin/bash
echo "Staging, committing, and pushing all repositories (including parent repo if applicable)..."

BASE="$(pwd)"  # ~/Documents/GitHub

# First, check if BASE itself is a git repo
if [ -d "$BASE/.git" ]; then
    cd "$BASE"
    if ! git diff --quiet || ! git diff --cached --quiet; then
        git add .
        git commit -m "Auto-update: staged changes"
        git push
        echo "Pushed changes in parent repo: $BASE"
    else
        echo "No changes to push in parent repo: $BASE"
    fi
fi

# Then loop through all subfolders
for dir in "$BASE"/*; do
    if [ -d "$dir/.git" ]; then
        cd "$dir" || continue
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
