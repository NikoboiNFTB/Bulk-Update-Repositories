⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️  
⚠️ This repository is in the middle of an update,  
⚠️ scripts work, but descriptions may not be accurate.  
⚠️ Please review each script carefully before running anything.  
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️

# GitHub-Tools

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

These scripts automate local Git tasks. Each file is a bash script. The extension `.sh` has been stripped for cleanliness.

- All examples assume this directory structure:
  - `~/GitHub/$author/$repo`
- Example:
  - `~/GitHub/NikoboiNFTB/GitHub-Tools`
- Use differing paths on your own accord.

You should have a basic understanding of SSH, Git, and simple Linux commands (`wget`, `chmod`, `./` etc.). You *can* use these without knowing what you're doing, but no sane person will ever recommend you do that.

Run scripts using `./script`. If it fails, make it executable using `chmod -f +x script`.

Run the setup script to install all scripts in the current directory, as well as in a (new) folder `~/git/`
- `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup && chmod -f +x setup && ./setup`  

The setup script will remove itself after execution.



### [`all-pull`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-pull) and [`all-push`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-push)  
- Run inside `~/GitHub/$author`.  
- Will run `git pull` or `git add .`, `git commit -m "Automated push"` and `git push` in every folder in the current directory.  



### Git - Clone Repositories

Clone all public repos from any GitHub user. Download the script:  
- `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/clone && chmod -f +x clone`  
And run it:  
- `./clone`

Can be run however many times you want to clone every author's repositories you want. Sky is the limit... and your network.  
>> Note: Cloning many or large repositories can take a long time.

To copy my personal workflow, you can just run:  
- `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/workflow && chmod -f +x workflow && ./workflow && cd NikoboiNFTB`  



### Git - Disable and Enable SSH

These scripts are used to, you guessed it, disable and enable SSH on your local machine, while keeping the same public key linked to your GitHub account.

>> Note: These scripts are convenience tools, not high-security mechanisms.  
>> They are, however, hidden for a little bit of extra feelgood.



#### [`.disable-ssh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/.disable-ssh) and [`.enable-ssh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/.enable-ssh)

Install script will place them in ~/, so they can be run from anywhere.  
`.disable-ssh` and `.enable-ssh` are set up using the same command as `all-pull` and `all-push`:  
- `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup-author && chmod -f +x setup-author && ./setup-author`

What the scripts do;  
- `./.disable-ssh`  
  - Makes a folder ~/.ssh.bak  
  - Moves `id_ed25519` and `id_ed25519.pub` from `~/.ssh` to `~/.ssh.bak`  
  - Removes all SSH keys using `ssh-add -D`  
- `./.enable-ssh`  
  - Moves `id_ed25519` and `id_ed25519.pub` back from `~/.ssh.bak` to `~/.ssh`  
  - Adds the SSH key using `ssh-add ~/.ssh/id_ed25519`  
  - Deletes `~/.ssh.bak`



## License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**. See [LICENSE](LICENSE) for details.

Author: [Nikoboi](https://github.com/NikoboiNFTB)
