#!/bin/bash

# Create a log file or clear it if it already exists
log_file="./pull.log"
> "$log_file"

# Loop through all subdirectories
for dir in */; do
  # Check if the directory contains a .git folder
  if [ -d "$dir/.git" ]; then
    echo "Pulling in repository: $dir"
    (
      cd "$dir" || exit    # Navigate to the repo (run in a subshell)
      git pull             # Run git pull
      if [ $? -eq 0 ]; then
        # Log the updated repo
        echo "Updated: $dir" >> "$log_file"
      else
        # Log if there was no update or an issue
        echo "No updates or error: $dir" >> "$log_file"
      fi
    ) &
  else
    echo "$dir is not a git repository."
  fi
done

# Wait for all background jobs to finish
wait

# Final message
echo "All git pulls are complete! Check the 'pull.log' file for details."
