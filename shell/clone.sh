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

echo "All done!"

#
#  <======== GUIDE START ========>
#
#    Here's how to personalize this script efficiently for your own use (step-by-step):
#
#    Step 1. Run: curl -s "https://api.github.com/users/$author/repos?per_page=200" | jq -r '.[].name'
#            (Don't forget to change the $author)
#
#    Step 2: Paste the result above, inside repos=(
#
#                                                 )
#
#            And don't forget to change the $author to your username again, in this script.
#
#    Step 3. Run it. You will need to make it executable using `chmod +x clone.sh`.
#
#  <======== GUIDE END ========>
#
