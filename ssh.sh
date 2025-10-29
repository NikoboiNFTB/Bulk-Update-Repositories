#!/bin/bash

# Prompt the user for their GitHub username
read -p "Enter your GitHub username: " username

# Validate the username
if [ -z "$username" ]; then
  echo "Error: You must enter a username."
  exit 1
fi

# Loop through all subdirectories
for dir in */; do
  # Check if the directory contains a .git folder
  if [ -d "$dir/.git" ]; then
    echo "Setting SSH for repository: $dir"
    cd "$dir" || continue   # Navigate to the repo

    # Get the current HTTPS remote URL
    current_url=$(git remote get-url origin)

    # Check if it's using HTTPS (to avoid modifying SSH URLs)
    if [[ "$current_url" == https://github.com/* ]]; then
      # Extract the repository name from the current URL
      repo_name=$(basename "$current_url" .git)

      # Set the remote URL to use SSH format
      git remote set-url origin "git@github.com:$username/$repo_name.git"

      echo "Updated to SSH: git@github.com:$username/$repo_name.git"
    else
      echo "$dir is already using SSH or is not using HTTPS."
    fi

    cd ..  # Go back to the parent directory
  else
    echo "$dir is not a git repository."
  fi
done

echo "All repositories have been updated to use SSH!"

