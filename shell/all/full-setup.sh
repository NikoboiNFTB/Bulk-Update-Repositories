#!/bin/bash
# Clone all repos into a directory named after the username
#
# Here's how to setup efficiently for your own use (step-by-step):
#
# Step 1. Go to your repositories at https://github.com/$author?tab=repositories
#
# Step 2. Extract all links using the filter "https://github.com/$author/" using Link Gopher
#
# Step 3. Paste all the links anywhere using your favorite text editor. I like VSCodium for its seek and destroy functionality.
#         Step 1. Use VSCodium's "Ctrl + F" tool to search for "https://github.com/$author/"
#         Step 2. Hit enter until it's removed all the links, leaving only the repository name.
#
# Step 4. Copy the repository names and paste the under repos=(). Don't forget to change author="" to your GitHub username.
#
# Step 5. Run it. You will need to make it executable using `chmod +x all-clone.sh`.

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
cp GitHub-Tools/shell/all/all-pull.sh all-pull.sh 2>/dev/null || true
cp GitHub-Tools/shell/all/all-push.sh all-push.sh 2>/dev/null || true
echo "All files copied"

wait

echo "Listing items..."
ls -1
echo "Items listed"

echo "All done!"
