#!/usr/bin/env bash
# Only print lines equivalent to:
# ./all-repos-pull.sh | grep "updated successfully"

set -e

declare -a pids  # Track background job PIDs

for dir in */; do
  if [ -d "$dir/.git" ]; then
    (
      cd "$dir" || exit
      repo_name=$(basename "$dir")

      if git fetch --quiet && git pull --ff-only >/dev/null 2>&1; then
        echo "$repo_name updated successfully"
      fi
    ) &
    pids+=($!)
  fi
done

for pid in "${pids[@]}"; do
  wait "$pid" || true
done
