#!/bin/bash
echo "Staging, committing, and pushing all repositories (including parent repo if applicable)..."

BASE="$(pwd)"  # ~/Documents/GitHub

# First, check if BASE itself is a git repo
if [ -d "$BASE/.git" ]; then
    cd "$BASE"
    # Stage and commit if there are changes
    if ! git diff --quiet || ! git diff --cached --quiet; then
        git add .
        git commit -m "Auto-update: staged changes"
        echo "Committed changes in parent repo: $BASE"
    else
        echo "No changes to commit in parent repo: $BASE"
    fi
    # Always push
    git push
    echo "Pushed parent repo: $BASE"
fi

# Then loop through all subfolders
for dir in "$BASE"/*; do
    if [ -d "$dir/.git" ]; then
        cd "$dir" || continue
        if ! git diff --quiet || ! git diff --cached --quiet; then
            git add .
            git commit -m "Auto-update: staged changes"
            echo "Committed changes in $dir"
        else
            echo "No changes to commit in $dir"
        fi
        git push
        echo "Pushed $dir"
    fi
done

echo "All done!"
