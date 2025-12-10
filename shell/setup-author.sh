#!/usr/bin/env bash

echo "Downloading files..."
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/auto-pull.sh && chmod -f +x auto-pull.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/auto-push.sh && chmod -f +x auto-push.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/disable-s.sh && chmod -f +x disable-s.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/enable-s.sh && chmod -f +x enable-s.sh
echo "Files downloaded"

echo "Cleaning up..."
rm -f setup-author.sh
echo "Cleanup done"

echo "All done!"

echo "Tip: The files can be renamed to whatever you want"
