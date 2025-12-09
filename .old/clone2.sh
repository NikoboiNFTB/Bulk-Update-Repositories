#!/bin/bash

author="NikoboiNFTB"
# You can freely change the author to anyone.

echo "Fetching repo list..."
repos=$(curl -s "https://api.github.com/users/$author/repos?per_page=200" \
        | jq -r '.[].name')

mkdir -p "$author"
cd "$author" || exit 1

echo "Cloning..."
for repo in $repos; do
  git clone "https://github.com/$author/$repo.git" > /dev/null 2>&1 &
done

wait
echo "Done."

# Optional: Switch remotes from HTTPS to SSH
# Uncomment to enable
#
# echo "Converting remotes to SSH..."
# for repo in $repos; do
#   if [ -d "$repo/.git" ]; then
#     cd "$repo" || continue
#     git remote set-url origin "git@github.com:$author/$repo.git"
#     cd ..
#   fi
# done
# echo "SSH remotes set."
