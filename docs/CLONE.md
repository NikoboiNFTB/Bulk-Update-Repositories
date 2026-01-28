# Cloning Scripts

Scripts for cloning repositories.

## Note

If you get this:

```text
Username for 'https://github.com': 
```

The repo is private or doesn't exist. Don't bother with it, GitHub no longer even supports login like that via CLI.

## Scripts

### `clone-author`

Clones all public repositories for a specified GitHub user into a single folder. Supports both SSH and HTTPS cloning methods and skips repositories that already exist locally.

#### Usage

Provide a GitHub username as an argument or enter it when prompted:

```bash
bash clone-author NikoboiNFTB SSH
```

```bash
./clone-author NikoboiNFTB
```

Will clone your selected repositories into `$HOME/GitHub/$AUTHOR`

### `clone-repo`

Clones a specific GitHub repository from a given user into a folder named after the author. Supports both SSH and HTTPS and skips cloning if the repository already exists locally.

#### Usage

Provide the GitHub username and repository name as arguments, or enter them when prompted:

```bash
bash clone-repo NikoboiNFTB GitHub-Tools HTTPS
```

```bash
./clone-repo
```

Will clone your selected repository into `$HOME/GitHub/$AUTHOR/$REPO`

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
