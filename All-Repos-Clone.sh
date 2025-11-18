#!/bin/bash
# A simple script to clone all NikoboiNFTB repositories

repos=(
  ChatGPT-Tweaks
  FreeCAD-Python
  GitHub-Tweaks
  IMDb-RePo
  Metal-Archives-Tweaks
  Minecraft
  MySpicetifyTheme
  nikoboinftb.github.io
  Search-on-GTACars
  SearchWith
  Songsterr-Tweaks
  TikTok-Auto-Poster
  website-to-apk
  YouTube-Tweaks
)

for repo in "${repos[@]}"; do
  echo "Cloning $repo..."
  git clone "https://github.com/NikoboiNFTB/$repo"
done

echo "✅ All repositories cloned successfully."
