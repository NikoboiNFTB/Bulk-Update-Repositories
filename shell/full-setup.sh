#!/bin/bash

author="NikoboiNFTB"

repos=(
  ChatGPT-Tweaks
  FreeCAD-Python
  GitHub-Tools
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

mkdir -p "$author"
cd "$author" || exit 1

for repo in "${repos[@]}"; do
  echo "Cloning $repo..."
  git clone "git@github.com:$author/$repo.git" &
done

wait

echo "All clones finished."

echo "Copying files..."
cp GitHub-Tools/shell/all-pull.sh all-pull.sh 2>/dev/null || true
cp GitHub-Tools/shell/all-push.sh all-push.sh 2>/dev/null || true
echo "All files copied"

wait

echo "Listing items..."
ls -1
echo "Items listed"

echo "All done!"
