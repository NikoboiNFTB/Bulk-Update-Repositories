# Bulk Repository Management

These scripts exist to automate repository management, en massé. The goal is that you never have to touch the terminal when developing with Git.

## Scripts

### [`mass-pull`](/shell/git/mass/mass-pull)

Automatically pull **all repos** in **all authors** in your `~/GitHub/` folder.

#### Usage

Run the script from the parent directory containing your Git author folders:

```bash
./all-push
```

### [`new-repo`](/shell/git/mass/new-repo)

Automate the whole process of creating a repository locally and on GitHub.

Requires `git` and `gh`.

#### Usage

Just run the `new-repo` script.

## Installation

You can install any one of the scripts into any folder by running:

```bash
wget https://nikoboinftb.github.io/shell/*
```

>> Fill in the path to the script

Or run the automation setup script. Run anywhere (the script self-corrects using `$HOME`, `mkdir -p` and `cd`):

```bash
bash <(wget -qO- https://nikoboinftb.github.io/shell/git/setup/automation)
```

The `automation` setup script also works as an update script.

>> Will setup my entire automation workflow [`/shell/git/`](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/shell/git/). See [File Tree](README.md#file-tree) for details.
