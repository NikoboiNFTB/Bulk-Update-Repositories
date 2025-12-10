#!/bin/bash

# Prompt for target GitHub username
read -rp "Enter GitHub username of target: " author
[ -z "$author" ] && { echo "No username entered. Exiting."; exit 1; }

# Prompt for clone method
read -rp "SSH or HTTPS (if unsure, type HTTPS or hit Enter): " method
method=$(echo "$method" | tr '[:upper:]' '[:lower:]')

if [[ "$method" == "ssh" ]]; then
    clone_prefix="git@github.com:$author"
else
    clone_prefix="https://github.com/$author"
    method="https"
fi

echo "Fetching repo list for $author..."
repos=$(curl -s "https://api.github.com/users/$author/repos?per_page=200" \
        | jq -r '.[].name')

mkdir -p "$author"
cd "$author" || exit 1

echo "Cloning using $method..."
for repo in $repos; do
  if [ -d "$repo/.git" ]; then
    echo "$repo already exists, skipping."
    continue
  fi
  if git clone "$clone_prefix/$repo.git" >/dev/null 2>&1; then
    echo "Cloned $repo"
  else
    echo "Failed to clone $repo" >&2
  fi
done

wait
echo "Done!"
