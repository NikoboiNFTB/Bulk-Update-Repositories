⚠️ This repository is undergoing large changes. README.md files may not be accurate.

# Repository Management

These scripts exist to automate repository management.

## Scripts

### [`pull`](/shell/git/repo/pull)

Pulls the latest changes for the current Git repository.

#### Usage

Save the script to the parent directory containing your Git repos, and run them from the repository folder:

```bash
../pull
```

>> `..` means parent directory

### [`push`](/shell/git/repo/push)

Stage, commit, and push changes for the current repository. Supports custom commit message.

#### Usage

Save the script to the parent directory containing your Git repos, and run them from the repository folder:

```bash
../push
```

>> `..` means parent directory

### [`status`](/shell/git/repo/status)

Displays the current `git status` for all repositories in subdirectories, showing staged and unstaged changes for each.

#### Usage

Save the script to the parent directory containing your Git repos, and run them from the repository folder:

```bash
../status
```

>> `..` means parent directory

## Installation

Run in;

```text
~/GitHub/$AUTHOR/
```

```bash
bash <(wget -qO- https://nikoboinftb.github.io/sh/git/setup/automation)
```

>> Will download most files in [`/sh/git/`](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh/git/).
