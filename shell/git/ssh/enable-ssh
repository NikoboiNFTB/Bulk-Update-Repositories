#!/usr/bin/env bash
set -e

SSH_DIR="$HOME/.ssh"
BACKUP_DIR="$HOME/.ssh.bak"

echo "Enabling SSH..."

[ -f "$BACKUP_DIR/id_ed25519" ] && mv -f "$BACKUP_DIR/id_ed25519" "$SSH_DIR/"
[ -f "$BACKUP_DIR/id_ed25519.pub" ] && mv -f "$BACKUP_DIR/id_ed25519.pub" "$SSH_DIR/"

chmod 600 "$SSH_DIR/id_ed25519" 2>/dev/null || true
chmod 644 "$SSH_DIR/id_ed25519.pub" 2>/dev/null || true

ssh-add "$SSH_DIR/id_ed25519" || echo "ssh-agent not running"

if [ -d "$BACKUP_DIR" ]; then
    rmdir "$BACKUP_DIR" 2>/dev/null || rm -rf "$BACKUP_DIR"
fi

echo "SSH enabled."
