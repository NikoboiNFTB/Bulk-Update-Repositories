# SSH

These scripts disable and enable SSH. id_ed26619 key required.

## Scripts

### [`disable-ssh`](/shell/git/ssh/disable-ssh)

Disables SSH by moving your ID_ED25519 SSH keys from `$HOME/.ssh` to `$HOME/.ssh.bak`

#### Usage

Save the script and run it anywhere:

```bash
bash disable-ssh
```

### [`enable-ssh`](/shell/git/ssh/enable-ssh)

Enables SSH.

#### Usage

Enables SSH by moving your ID_ED25519 SSH keys back from `$HOME/.ssh.bak` to `$HOME/.ssh`

```bash
bash enable-ssh
```

## Installation

You can install any one of the scripts into any folder by running:

```bash
wget https://github.com/NikoboiNFTB/GitHub-Tools/tree/main/shell/*
```

>> Fill in the path to the script

Or run the automation setup script. Run anywhere (the script self-corrects using `$HOME`, `mkdir -p` and `cd`):

```bash
bash <(wget -qO- https://nikoboinftb.github.io/sh/git/setup/automation)
```

>> Will setup my entire automation workflow [`/sh/git/`](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh/git/). See [file tree](README.md#file-tree) for details.
