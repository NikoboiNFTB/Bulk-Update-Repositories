#!/bin/bash
# -------------------------------------------------------------
# Pull the latest changes for all git repositories in the current directory.
#
# Expected structure:
#   */<Run-This-Script-In-This-Folder>/<Repositories-With-.git-Folder>
#
# Behavior:
#   • Runs `git pull` in every subfolder containing a .git folder.
#   • Runs pulls in parallel for faster completion.
#   • Prints clear per-repo progress messages.
#   • Skips folders that aren’t git repositories.
#   • Handles errors gracefully.
# -------------------------------------------------------------

set -e

echo "🔄 Updating all repositories in: $(pwd)"
echo

declare -a pids  # Track background job PIDs

for dir in */; do
  if [ -d "$dir/.git" ]; then
    (
      cd "$dir" || exit
      repo_name=$(basename "$dir")
      echo "→ Pulling updates for $repo_name"

      if git fetch --quiet && git pull --ff-only; then
        echo "✓ $repo_name updated successfully"
      else
        echo "⚠️  Failed to update $repo_name"
      fi

      echo
    ) &
    pids+=($!)
  else
    echo "Skipping: $dir (not a git repository)"
  fi
done

for pid in "${pids[@]}"; do
  wait "$pid" || true
done

echo "✅ All repositories processed."
