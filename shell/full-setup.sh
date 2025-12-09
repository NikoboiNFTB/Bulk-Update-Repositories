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

echo "Creating directory..."
mkdir -p "$author"
cd "$author" || exit 1
echo "Directory created"

echo "Cloning repositories..."
for repo in "${repos[@]}"; do
  echo "Cloning $repo..."
  git clone "git@github.com:$author/$repo.git" > /dev/null 2>&1 &
done

wait

echo "Cloning finished"

echo "Copying files..."
cp GitHub-Tools/shell/all-pull.sh all-pull.sh 2>/dev/null || true
cp GitHub-Tools/shell/all-push.sh all-push.sh 2>/dev/null || true
echo "All files copied"

wait

echo "Listing items..."
ls -1
echo "Items listed"

echo "All done!"

#
#  <======== GUIDE START ========>
#
#    Here's how to personalize this script efficiently for your own use (step-by-step):
#
#    Step 1. Run: curl -s "https://api.github.com/users/$author/repos?per_page=200" | jq -r '.[].name'
#            (Don't forget to change the $author to your username)
#            Copy the resulting lines by triple-clicking the first one, and dragging over to the last one. Then Right Click -> Copy
#
#    Step 2: Run: nano clone.sh
#            Edit author="" and repos=() according to instructions next to each
#            To save using nano, hit "Ctrl + O", "Enter", "Ctrl + X"
#
#    Step 3. Run: ./clone.sh && cd $author
#            (You don't need to change $author here, it actually works like this!)
#
#  <======== GUIDE END ========>
#
