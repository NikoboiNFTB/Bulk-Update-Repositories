#!/usr/bin/env bash

read -rp "SSH or HTTPS (if unsure, type HTTPS or hit Enter): " method
method=$(echo "$method" | tr '[:upper:]' '[:lower:]')

if [[ "$method" == "ssh" ]]; then
    clone_prefix="git@github.com:NikoboiNFTB"
else
    clone_prefix="https://github.com/NikoboiNFTB"
    method="https"
fi

echo "Fetching repo list for NikoboiNFTB..."
repos=$(curl -s "https://api.github.com/users/NikoboiNFTB/repos?per_page=200" \
        | jq -r '.[].name')

mkdir -p "NikoboiNFTB"
cd "NikoboiNFTB" || exit 1

echo "Cloning using $method..."
for repo in $repos; do
  if [ -d "$repo/.git" ]; then
    echo "$repo already exists, skipping."
    continue
  fi
  if git clone "$clone_prefix/$repo.git" >/dev/null 2>&1; then
    echo "Cloned $repo"
  else
    echo "Failed to clone $repo" >&2
  fi
done

wait

echo "Copying files..."
cp GitHub-Tools/shell/auto-pull.sh auto-pull.sh && chmod -f +x auto-pull.sh
cp GitHub-Tools/shell/auto-push.sh auto-push.sh && chmod -f +x auto-push.sh
cp GitHub-Tools/shell/all-pull.sh all-pull.sh && chmod -f +x all-pull.sh
cp GitHub-Tools/shell/all-push.sh all-push.sh && chmod -f +x all-push.sh
cp GitHub-Tools/shell/disable-s.sh disable-s.sh && chmod -f +x disable-s.sh
cp GitHub-Tools/shell/enable-s.sh enable-s.sh && chmod -f +x enable-s.sh
chmod -f +x */pull.sh
chmod -f +x */push.sh
echo "Files copied"

echo "Done!"
