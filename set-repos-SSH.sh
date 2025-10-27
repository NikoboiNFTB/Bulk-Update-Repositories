#!/bin/bash
BASE=~/Documents/GitHub
GITHUB_USER="NikoboiNFTB"

for dir in "$BASE"/*; do
    if [ -d "$dir/.git" ]; then
        cd "$dir" || continue
        REPO_NAME=$(basename "$dir")
        SSH_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"
        git remote set-url origin "$SSH_URL"
        echo "Set SSH URL for $dir to $SSH_URL"
    fi
done
