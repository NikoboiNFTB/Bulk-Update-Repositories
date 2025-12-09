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
