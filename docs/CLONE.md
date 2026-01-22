⚠️ This repository is undergoing large changes. README.md files may not be accurate.

# Cloning Scripts

Note: If you get this:

```text
Username for 'https://github.com': 
```

The repo is private or doesn't exist. Don't bother with it, Git no longer even supports login like that via CLI.

## Scripts

### `clone-author`

Clones all public repositories for a specified GitHub user into a single folder. Supports both SSH and HTTPS cloning methods and skips repositories that already exist locally.

#### Usage

Provide a GitHub username as an argument or enter it when prompted:

```bash
./clone-author NikoboiNFTB
```

You will then choose `SSH` or `HTTPS` for cloning (if you don't know the difference, pick HTTPS, or just hit Enter). The script creates a folder named after the user and clones all repositories into it.

### `clone-author-turbo`

A faster version of `clone-author` that clones all repositories for a user in parallel. 

#### Usage

Use just like `clone-author`:

```bash
./clone-author-turbo NikoboiNFTB
```

The script defaults to 8 parallel cloning jobs, but you can change JOBS value to change amount of background jobs:

```bash
JOBS=32 bash clone-author-turbo NikoboiNFTB
```

>> Will run 32 at a time.

### `clone-repo`

Clones a specific GitHub repository from a given user into a folder named after the author. Supports both SSH and HTTPS and skips cloning if the repository already exists locally.

#### Usage

Provide the GitHub username and repository name as arguments, or enter them when prompted:

./script.sh username repo

The script will create a folder for the user and clone the repository into it. It also provides guidance on common reasons a clone might fail, including private repos or authentication issues.
