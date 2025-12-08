#!/bin/bash
# -------------------------------------------------------------
# Commit and push all repositories in the current directory.
#
# Expected structure:
#   */<GitHub-Username>/<Repositories>
#
# Run this script inside:
#   ~/Documents/GitHub/<GitHub-Username>
#
# Behavior:
#   • For each subfolder with a .git directory:
#       - Checks for staged or unstaged changes.
#       - If found, stages all changes and commits with a standard message.
#       - Pushes to the remote.
#   • Skips repositories with no changes.
#   • Handles failures gracefully.
#   • Runs commits and pushes in parallel.
# -------------------------------------------------------------

set -e

echo "🪶 Committing and pushing repositories in: $(pwd)"
echo

declare -a pids  # Track background job PIDs

for dir in */; do
  # Skip non-git directories
  if [ ! -d "$dir/.git" ]; then
    echo "Skipping: $dir (not a git repository)"
    continue
  fi

  (
    cd "$dir" || exit
    repo_name=$(basename "$dir")

    # Check if there are changes to commit
    if ! git diff --quiet || ! git diff --cached --quiet; then
      echo "→ Committing changes in $repo_name"
      git add -A

      # Use timestamped commit message for clarity
      commit_msg="Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
      git commit -m "$commit_msg" >/dev/null 2>&1
      echo "✓ Changes committed in $repo_name"
    else
      echo "No changes in $repo_name"
    fi

    # Always push, even if nothing new (to sync local branches)
    if git push >/dev/null 2>&1; then
      echo "↑ Pushed $repo_name successfully"
    else
      echo "⚠️  Failed to push $repo_name"
    fi

    echo
  ) &
  pids+=($!)
done

# Wait for all background jobs
for pid in "${pids[@]}"; do
  wait "$pid" || true
done

echo "✅ All repositories processed."
