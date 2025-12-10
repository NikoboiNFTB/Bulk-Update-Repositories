# GitHub-Tweaks

>> Not 100% finished yet.

A collection of scripts and userscripts for automating GitHub maintenance and repository management.

Each tool exists to make repetitive Git tasks a little less tedious.



## Userscripts (for web)

These scripts are used to automate tasks on the [GitHub](https://github.com/) website. They can be used with zero experience.

To use them, you will need a userscript manager, such as [Violentmonkey](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) (Firefox) or [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) (Chromium).

>> **Chromium Users:**  
>> Make sure Tampermonkey can actually *run* userscripts:  
>> - Go to `chrome://extensions/` (or equivalent)  
>> - Click **Details** under Tampermonkey  
>> - Enable **“Allow access to file URLs”**, **“Allow User Scripts”** and **"Developer Mode"**, then hit **"Update"**



### GitHub – Deletion Confirmation Auto-filler

Automates GitHub’s multi-step “Delete this repository” process. The script clicks through intermediate modals and auto-types the repository name. You still manually click the first and last delete buttons, and you will need to stay in the window during the process, otherwise GitHub whines that you're a bot.

Install the Semi-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-delete-1.2.user.js))  
>> Only types in the text box.

Install the Full-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-delete-1.6.user.js))  
>> Handles everything between the first and last click.



### GitHub - Auto-Reload if Pending Deployment ([install](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-reload-1.2.user.js))

Reloads the repository page automatically when the project is in a “pending deployment” state. For GitHub Pages.



## Shell Scripts (for git)

These scripts automate local Git tasks.

- All examples assume this directory structure:
  - `~/GitHub/$author/$repo`
- Example:
  - `~/GitHub/NikoboiNFTB/GitHub-Tools`
- Use differing paths on your own accord.

You should have a basic understanding of SSH, Git, and simple Linux commands (`wget`, `chmod`, `./` etc.). You *can* use these without knowing what you're doing, but no person worth listening to will ever recommend you do that.

Run scripts using `./script.sh`. If it fails, make it executable using `chmod -f +x script.sh`.

All setup scripts remove themselves after execution.



### Git - Pull/Push Automation

These scripts can be used to automatically pull or add, commit and push changes for repositories.



#### [`pull.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/pull.sh), [`push.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/push.sh), [`all-pull.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-pull.sh) and [`all-push.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-push.sh)  
- The first two go in `~/GitHub/$author/$repo` and the other two go in `~/GitHub/$author`  
- Running them behaves exactly like running:  
  - `git pull`  
  - `git add .`, `git commit -m "Automated push"` and `git push`  
- Git commit message can be modified freely in the scripts.

Easily set them up by simply running:  
- `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup-repo.sh && chmod -f +x setup-repo.sh && ./setup-repo.sh`
in `~/GitHub/$author`
- What the command does:
  - Downloads, allows execution and executes `setup-repo.sh` (separated by &&)
- What `setup-repo.sh` does:
  - Download `pull.sh`, `push.sh`, `all-pull.sh` and `all-push.sh`  
  - Copy `pull.sh` and `push.sh` into every folder in the current directory.  
  - Delete those two files, as well as `setup-repo.sh` from the projects folder (they aren't needed there anymore).  
  - Grant every file permission to be executed.



#### [auto-pull.sh](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/auto-pull.sh) and [auto-push.sh](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/auto-push.sh)
- Run inside `~/GitHub/$author`.  
- Will run `git pull` or `git add .`, `git commit -m "Automated push"` and `git push`  
- Setup easily by running:
  - `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup-author.sh && chmod -f +x setup-author.sh && ./setup-author.sh`  
  - Downloads, allows execution and executes `setup-author.sh` (separated by &&)
- What `setup-author.sh` does:
  - Download `auto-pull.sh` and `auto-push.sh`, and allow them to be executed.  
  - Delete `setup-author.sh`



### Git - Clone Repositories

Clone all public repos from any GitHub user. Download the script:  
- `wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/clone.sh && chmod -f +x clone.sh`  
And run it:  
- `./clone.sh`  
>> Note: Cloning many or large repositories can take a long time.  
>> Can be run however many times you want to clone every author's repositories you want. Sky is the limit. And your network.



### Git - Copy my Personal Workflow

`wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/workflow.sh && chmod -f +x workflow.sh && ./workflow.sh && cd NikoboiNFTB`



### Git - Disable and Enable SSH

These scripts are used to, you guessed it, disable and enable SSH on your local machine, while keeping the same public key linked to your GitHub account.

>> Note: These scripts are convenience tools, not high-security mechanisms.



#### [`disable-s.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/disable-s.sh) and [`enable-s.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/enable-s.sh)

Can be run from anywhere, doesn't matter. I recommend `$author`, though, so all the scripts are collected in one place.

What the scripts do;  
- `./disable-s.sh`  
  - Makes a folder ~/.ssh.bak  
  - Moves `id_ed25519` and `id_ed25519.pub` from `~/.ssh` to `~/.ssh.bak`  
  - Removes all SSH keys using `ssh-add -D`  
- `./enable-s.sh`  
  - Moves `id_ed25519` and `id_ed25519.pub` back from `~/.ssh.bak` to `~/.ssh`  
  - Adds the SSH key using `ssh-add ~/.ssh/id_ed25519`  
  - Deletes `~/.ssh.bak`



## License

This project is licensed under the GNU General Public License v3.0 (GPLv3). See [LICENSE](LICENSE) for details.

Author: [Nikoboi](https://github.com/NikoboiNFTB)
