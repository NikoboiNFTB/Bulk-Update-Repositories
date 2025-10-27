#!/bin/bash
echo "Updating all repositories..."
find . -maxdepth 1 -mindepth 1 -type d -exec test -d "{}/.git" \; -print | xargs -P0 -I{} sh -c 'git -C "{}" pull >/dev/null 2>&1'
echo "Done!"
