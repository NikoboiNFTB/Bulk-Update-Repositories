#!/bin/bash
BASE=~/Documents/GitHub

for dir in "$BASE"/*; do
    if [ -d "$dir/.git" ]; then
        cd "$dir" || continue
        HTTPS_URL=$(git remote get-url origin)
        # Only switch if it’s HTTPS
        if [[ $HTTPS_URL == https://github.com/* ]]; then
            # Convert HTTPS to SSH
            REPO_NAME=$(basename "$dir")
            SSH_URL="git@github.com:$(basename $(dirname "$dir"))/$REPO_NAME.git"
            git remote set-url origin "$SSH_URL"
            echo "Switched $dir to SSH"
        fi
    fi
done
