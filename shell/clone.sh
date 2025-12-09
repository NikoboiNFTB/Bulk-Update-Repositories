#!/bin/bash

author="" # Your GitHub username goes inside the quotation marks.

repos=(
) # Paste the result of Step 1 before the ")"

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

echo "Deleting installation file..."
rm -f clone.sh
echo "Installation file deleted"

echo "All done!"

#  <======== GUIDE START ========>
#
#  How to personalize this script for your own use (step-by-step):
#  Note: You can re-read this tutorial at any time by running "cat clone.sh"
#
#  1. a) Run:
#        curl -s "https://api.github.com/users/$author/repos?per_page=200" | jq -r '.[].name'
#        Don't forget to change the $author to your GitHub username!!
#     b) Copy the resulting lines by:
#           Triple-click the first one,
#           Drag down to the last one,
#           Right click -> Copy
#
#  2. Run: nano clone.sh
#     Edit author and repos at the top according to instructions next to each
#     To save using nano, hit "Ctrl + O", "Enter", "Ctrl + X"
#
#  3. Run: ./clone.sh
#     Note: Cloning many repositories might take a while.
#
#  <======== GUIDE END ========>
