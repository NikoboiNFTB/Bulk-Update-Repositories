#!/usr/bin/env bash

echo "Removing files..."

cp */pull.sh GitHub-Tweaks/.old/pull.sh
cp */push.sh GitHub-Tweaks/.old/push.sh
rm -f */pull.sh
rm -f */push.sh
rm -f uninstall-repo.sh

echo "Done!"
