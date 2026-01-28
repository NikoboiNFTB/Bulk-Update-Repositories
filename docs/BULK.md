# Bulk Repository Management

These scripts exist to automate repository management, en massé. The goal is that you never have to touch the terminal when developing with Git.

## Scripts

### [`all-pull`](/shell/git/bulk/all-pull)

Automatically pulls the latest changes for all Git repositories in subdirectories, running updates concurrently and reporting success or failure for each.

#### Usage

Run the script from the parent directory containing your Git repos:

```bash
./all-pull
```

### [`all-push`](/shell/git/bulk/all-push)

Automatically stages, commits (with a default message), and pushes changes for all Git repositories in subdirectories. Runs operations concurrently and reports success or failure for each.

#### Usage

Run the script from the parent directory containing your Git repos:

```bash
./all-push
```

### [`all-status`](/shell/git/bulk/all-status)

Displays the current `git status` for all repositories in subdirectories, showing staged and unstaged changes for each.

#### Usage

Run the script from the parent directory containing your Git repos:

```bash
./all-status
```

### [`ignore`](/shell/git/bulk/ignore) and [`ignore-reset`](/shell/git/bulk/ignore-reset)

A pair of scripts to manage local Git ignore rules across all repositories in subdirectories.

#### `ignore`

Adds specified files or directories to the `git/info/exclude` file for all repositories, ignoring them locally without modifying `.gitignore`.

**Usage:**

Provide file or directory names as arguments:

```bash
./ignore file1 file2 dir1/ dir2/
```

If no arguments are given, the script will prompt for input.

#### `ignore-default`

Resets all `git/info/exclude` files to a default template, including standard comments and example patterns, effectively restoring a clean baseline for local ignores.

**Usage:**

Run the script from the parent directory containing your Git repos:

```bash
./ignore-default
```

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
