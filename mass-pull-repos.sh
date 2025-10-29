#!/bin/bash

# Loop through all subdirectories
for dir in */; do
  # Check if the directory contains a .git folder
  if [ -d "$dir/.git" ]; then
    echo "Pulling in repository: $dir"
    (
      cd "$dir" || exit    # Navigate to the repo (run in a subshell)
      git pull             # Run git pull
    ) &
  else
    echo "$dir is not a git repository."
  fi
done

# Wait for all background jobs to finish
wait

echo "All git pulls are complete!"
