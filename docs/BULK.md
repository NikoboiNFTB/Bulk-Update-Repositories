⚠️ This repository is undergoing large changes. README.md files may not be accurate.

# Repository Management Scripts

These scripts exist to automate repository management, en massé. The goal is that you never have to touch the terminal when developing with GitHub.

## Scripts

### [`all-pull`](/shell/git/bulk/all-pull)

Pulls all remote changes to local repository.

### [`all-push`](/shell/git/bulk/all-push)

Pushes all local changes to remote repository.

### [`all-status`](/shell/git/bulk/all-status)

Neatly displays the status of all repositories.

### [`ignore`](/shell/git/bulk/ignore) and [`ignore-wipe`](/shell/git/bulk/ignore-wipe)

Use `ignore` to add files to `*/.git/info/exclude` in every repository. Allows you to run `pull`, `push` and `status` directly from the repository folder, without having to push them. `ignore-wipe` will wipe the `*/.git/info/exclude` files.

## Installation

Run in;

```text
~/GitHub/$AUTHOR/
```

```bash
bash <(wget -qO- https://nikoboinftb.github.io/sh/git/setup/automation)
```

>> Will download most files in [`/sh/git/`](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh/git).