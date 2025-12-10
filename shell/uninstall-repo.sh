#!/bin/bash

Echo "Uninstalling files..."

cp */pull.sh pull.sh
cp */push.sh push.sh
rm -f */pull.sh
rm -f */push.sh
cp pull.sh GitHub-Tweaks/shell/pull.sh
cp push.sh GitHub-Tweaks/shell/push.sh
rm pull.sh
rm push.sh

Echo "Done!"
