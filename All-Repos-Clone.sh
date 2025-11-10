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
  Search-on-GTACars
  SearchWith
  Songsterr-Tweaks
  TikTok-Auto-Poster
  YouTube-Tweaks
  links
  open-links
  video-player
)

for repo in "${repos[@]}"; do
  echo "Cloning $repo..."
  git clone "https://github.com/NikoboiNFTB/$repo"
done

echo "✅ All repositories cloned successfully."
