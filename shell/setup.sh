#!/bin/bash

echo "Downloading files..."
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/pull.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/push.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all-pull.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all-push.sh
echo "Files downloaded"

echo "Copying files..."
for d in */; do
    cp pull.sh "$d"
    cp push.sh "$d"
done
echo "All files copied"

echo "Cleaning up..."
rm -f pull.sh push.sh setup.sh
echo "Cleanup done"

echo "Adding executable permissions..."
chmod -f +x */pull.sh
chmod -f +x */push.sh
chmod -f +x all-pull.sh
chmod -f +x all-push.sh
echo "Permissions granted"

echo "All done!"
