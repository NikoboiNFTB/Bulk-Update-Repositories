#!/usr/bin/env bash
set -e

SSH_DIR="$HOME/.ssh"
BACKUP_DIR="$HOME/.ssh.bak"

mkdir -p "$BACKUP_DIR"

echo "Disabling SSH..."

[ -f "$SSH_DIR/id_ed25519" ] && mv -f "$SSH_DIR/id_ed25519" "$BACKUP_DIR/"
[ -f "$SSH_DIR/id_ed25519.pub" ] && mv -f "$SSH_DIR/id_ed25519.pub" "$BACKUP_DIR/"

ssh-add -D || true

echo "SSH disabled."
