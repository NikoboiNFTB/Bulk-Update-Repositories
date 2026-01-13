# GitHub-Tools

A collection of scripts and userscripts for automating GitHub maintenance and repository management.

Each tool exists to make repetitive Git tasks a little less tedious.

## TL;DR

- Userscripts that automate GitHub web.
- Bash scripts to manage Git repos.
- Assumes basic Linux, SSH and Git knowledge.
- You should see what each script does before running.
  - They aren't destructive, but they do things, and you should always know what you're running. I've tried my best to document as much as possible.

## Userscripts (for web)

These scripts are used to automate tasks on the [GitHub](https://github.com/) website. They can be used with zero experience.

To use them, you will need a userscript manager, such as [Violentmonkey](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) (Firefox) or [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) (Chromium).

>> **Chromium Users:**
>> You will need to make sure Tampermonkey can actually *run* userscripts:
>> - Go to `chrome://extensions/` (or equivalent)
>> - Click **Details** under Tampermonkey
>> - Enable **“Allow access to file URLs”**, **“Allow User Scripts”** and **"Developer Mode"**, then hit **"Update"**

### GitHub – Deletion Confirmation Auto-filler

Automates GitHub’s multi-step “Delete this repository” process. The script clicks through intermediate buttons and auto-types the repository name. You still manually click the first and last delete buttons, and you will need to stay in the window during the process, otherwise GitHub whines that you're a bot.

Install the Semi-Auto Version ([here](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/userscript/git-delete-1.2.user.js))

>> Only types in the text box.

Install the Full-Auto Version ([here](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/userscript/git-delete-1.6.user.js))

>> Handles everything between the first and last click.

### GitHub - Auto-Reload if Pending Deployment

Reloads the repository page automatically when the project is in a “pending deployment” state. Useful for GitHub Pages development.

 You can install it ([here](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/userscript/git-reload-1.2.user.js))

## Shell Scripts (for Git)

These scripts automate Git tasks on your machine. Each file is a shell script. The extension (`.sh`) has been stripped for cleanliness.

- All examples assume this directory structure:
  - `~/GitHub/$author/$repo`
- For example this repository would be:
  - `~/GitHub/NikoboiNFTB/GitHub-Tools`
- Use differing paths on your own accord.

You should have a basic understanding of **SSH**, **Git**, and simple Linux commands, like `wget`, `chmod`, `./` etc.

Run scripts with `./script` or double clicking them. If it fails, make sure it's executable by using `chmod +x script` or Properties in your favorite file manager.

### Disclaimer

**TL;DR**: Don't worry about the install commands using my domain. [Skip](#git---pullpush-automation)?

In install commands my own domain, [nikoboi.dev](https://nikoboi.dev/), will be used over the [raw.githubusercontent.com](https://raw.githubusercontent.com/) domain. This is for link shortening and clarity, as the github link is ridiculously long and has confusing paths, as you can see just below.

You're right to be vary about this, but you can easily confirm the files are identical by running (for example):

```bash
diff \
  <(wget -qO- https://nikoboi.dev/sh/pull) \
  <(wget -qO- https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/push)
```

This example will highlight the **differences** between the `pull` and `push` files. A blank or no result means they're identical.

I, of course, automated this process. You can try it out by running:

```bash
bash <(wget -qO- https://nikoboi.dev/sh/compare)
```

>> This is definitely absolutely not a maintenance script made public...

You can audit any script before running it by running:

```bash
cat <(wget -qO- https://nikoboi.dev/sh/compare)
```

>> The `cat` command is used to print file contents.

This is not only useful for this repo, but all scripts on the internet. Here's an example using the NextDNS install script:

```bash
cat <(wget -qO- https://nextdns.io/install)
```

The domain [nikoboi.dev](https://nikoboi.dev/) is active under my GitHub Pages repository, and its [`/sh/`](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh) folder can be audited at any time.

The scripts themselves will always call the github.com domain, because the scripts looking good isn't as important.

### Git - Pull/Push Automation

- [`all-pull`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all-pull)
- [`all-push`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all-push)
  - Run in `~/git/$author`.
  - Pulls or pushes all repositories at once.
  - Must be run in the projects folder.
- [`pull`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/pull)
- [`push`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/push)
  - Run in `~/git/$author/$repo`.
  - Only pulls or pushes one repository, the one it's run in.
  - Can be run in any repository with `../pull` if it's placed in the projects folder.

Install command:

```bash
bash <(wget -qO- https://nikoboi.dev/sh/setup-auto)
```

### Git - Clone Repositories

#### [`clone-repo`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/clone-repo): Clone a single specified repository.

- Download and allow execution command:

```bash
wget -q https://nikoboi.dev/sh/clone-repo
chmod +x clone-repo
```

- Run command:

```bash
./clone-repo
```

>> Note: Cloning large repositories can take a *long* time.

#### [`clone-author`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/clone-author): Clone all public repos from any GitHub user.

- Download and allow execution command:

```bash
wget -q https://nikoboi.dev/sh/clone-author
chmod +x clone-author
```

- Run command:

```bash
./clone-author
```

>> Note: Cloning many repositories can take a *long* time.

#### [`workflow`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/workflow): Copy my personal workflow.

```bash
mkdir -p ~/GitHub
cd ~/GitHub
bash <(wget -qO- https://nikoboi.dev/sh/workflow)
```

### Git - Disable and Enable SSH

These scripts are used to, you guessed it, disable and enable SSH on your machine, while keeping the same public key linked to your GitHub account.

>> Note: These scripts are for convenience, not high-security. If security is what you want, delete the key from your machine and your GitHub account. They can, however, be hidden for a little bit of extra feelgood. Just prefix the file name with a "." The `setup-ssh` script will ask you if you want to hide the files.

- [`disable-ssh`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/disable-ssh)
  - Makes a folder ~/.ssh.bak
  - Moves `id_ed25519` and `id_ed25519.pub` from `~/.ssh` to `~/.ssh.bak`
  - Removes all SSH keys using `ssh-add -D`
- [`enable-ssh`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/enable-ssh)
  - Moves `id_ed25519` and `id_ed25519.pub` back from `~/.ssh.bak` to `~/.ssh`
  - Adds the SSH key using `ssh-add ~/.ssh/id_ed25519`
  - Deletes `~/.ssh.bak`

The scripts are noth path-bound like the others, so feel free to install them wherever you want.

Install command:

```bash
bash <(wget -qO- https://nikoboi.dev/sh/setup-ssh)
```

### Git - Status

- [`all-status`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all-status)
  - Runs `git add .` and `git status` in every repository
- [`status`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/status)
  - Runs `git add .` and `git status` in the current repository.

Included in [`setup-auto`](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/setup-auto)

## Contributing

Feel free to fork this repository and submit issues or pull requests if you have any suggestions or improvements. If you encounter any bugs or have feature requests, please open an issue.

## Credits

Created by **[Nikoboi](https://github.com/NikoboiNFTB/)**  
Script logic fined tuned using ChatGPT

## License

This project is licenced under the GNU General Public License V3. See [LICENSE](LICENSE) for details.

## Legal Disclaimer

If needed, for traversing the gray areas.
