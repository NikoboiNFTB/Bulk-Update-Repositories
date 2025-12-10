#!/bin/bash

echo "Downloading files..."
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/auto-pull.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/auto-push.sh
echo "Files downloaded"

echo "Granting executable permissions..."
chmod -f +x auto-pull.sh
chmod -f +x auto-push.sh
echo "Permissions granted"

echo "Cleaning up..."
rm -f setup.sh
echo "Cleanup done"

echo "All done!"

echo "Tip: The files can be renamed to whatever you want"
