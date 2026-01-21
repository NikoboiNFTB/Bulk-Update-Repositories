# Repository Management Scripts

These scripts exist to automate repository management, en massé.

## Scripts

The scripts should be placed in;

```text
~/GitHub/$AUTHOR/
```

The scripts should be run in;

```text
~/GitHub/$AUTHOR/
```

They will then affect;

```text
~/GitHub/$AUTHOR/$REPO1
~/GitHub/$AUTHOR/$REPO2
~/GitHub/$AUTHOR/$REPO3
etc.
```

### [`all-pull`](/shell/git/bulk/all-pull)

Pulls all remote changes to local repository.

### [`all-push`](/shell/git/bulk/all-push)

Pushes all local changes to remote repository.

### [`all-status`](/shell/git/bulk/all-status)

Neatly displays the status of all repositories.

## Installation

Run in;

```text
~/GitHub/$AUTHOR/
```

```bash
bash <(wget -qO- https://nikoboinftb.github.io/sh/git/setup/bulk)
```
