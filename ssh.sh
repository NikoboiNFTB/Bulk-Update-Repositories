#!/bin/bash
# -------------------------------------------------------------
# Automatically switch all repositories in the current directory to SSH remotes.
#
# Expected folder structure:
#   ~/Documents/GitHub/<GitHub-Username>/<Repositories>
#
# Run this script inside:
#   ~/Documents/GitHub/<GitHub-Username>
#
# Behavior:
#   • Detects your GitHub username from the current folder name.
#   • Iterates through all subfolders (expected to be repositories).
#   • For each repository using HTTPS, switches its remote to SSH.
#   • Skips any folder that isn't a Git repo or is already using SSH.
#
# Requirements:
#   • Git must be installed and accessible in your PATH.
#   • Each repository must have a remote named "origin".
# -------------------------------------------------------------

set -e  # Exit immediately if any command fails

# Automatically detect GitHub username from the current folder name.
# Example: if PWD=/home/user/Documents/GitHub/NikoboiNFTB → username=“NikoboiNFTB”
username=$(basename "$PWD")

echo "Detected GitHub username: $username"
echo

# Iterate over all items in the current directory (expected to be repos)
for dir in */; do
  repo_path="${PWD}/${dir}"

  # Check if this folder contains a .git directory.
  # If not, skip it—it’s not a Git repository.
  if [ ! -d "$repo_path/.git" ]; then
    echo "Skipping: $dir (not a git repository)"
    continue
  fi

  # Move into the repository directory.
  cd "$repo_path" || continue

  # Try to get the URL of the 'origin' remote.
  # If it fails (e.g., no origin set), store an empty string instead.
  current_url=$(git remote get-url origin 2>/dev/null || echo "")

  # If no remote named origin exists, skip this repo.
  if [[ -z "$current_url" ]]; then
    echo "No remote named 'origin' in $dir, skipping."
  
  # If the remote uses HTTPS, convert it to SSH format.
  elif [[ "$current_url" == https://github.com/* ]]; then
    # Extract the repository name from the URL.
    # Example: https://github.com/NikoboiNFTB/Example.git → repo_name=“Example”
    repo_name=$(basename "$current_url" .git)

    # Build the SSH-style remote URL.
    new_url="git@github.com:$username/$repo_name.git"

    # Update the remote URL to SSH.
    git remote set-url origin "$new_url"

    echo "Updated $dir → $new_url"

  # Otherwise, if it's already SSH or a non-GitHub remote, skip it.
  else
    echo "Skipping $dir (already using SSH or non-GitHub remote)"
  fi

  # Return to the parent directory quietly (no printed path).
  cd - >/dev/null || exit
done

echo
echo "Done! All eligible repositories are now using SSH."
