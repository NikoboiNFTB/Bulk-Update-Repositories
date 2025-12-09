#!/bin/bash

echo "Downloading files..."
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/pull.sh
wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/push.sh
echo "Files downloaded"

echo "Copying files..."
for d in */; do
    cp pull.sh "$d"
    cp push.sh "$d"
done
echo "All files copied"

echo "All done!"
