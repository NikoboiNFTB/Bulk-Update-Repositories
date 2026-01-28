#!/bin/bash
# A simple script to clone all NikoboiNFTB repositories
# Hard-coded = Garbage

repos=(
  ChatGPT-Tweaks
  FreeCAD-Python
  GitHub-Tweaks
  ilyaxuwu.github.io
  IMDb-RePo
  Metal-Archives-Tweaks
  Minecraft
  MySpicetifyTheme
  nikoboinftb.github.io
  Search-on-GTACars
  SearchWith
  Songsterr-Tweaks
  TikTok-Tools
  TMDB-RePo
  website-to-apk
  YouTube-Tweaks
)

for repo in "${repos[@]}"; do
  echo "Cloning $repo..."
  git clone "https://github.com/NikoboiNFTB/$repo"
done

echo "✅ All repositories cloned successfully."
