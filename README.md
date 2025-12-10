# GitHub-Tweaks

A collection of scripts and userscripts to automate GitHub maintenance and repository management.  
Each tool is written to make repetitive Git tasks slightly less soul-crushing.

---

## Userscripts (for web)

These scripts are used to automate tasks on the [GitHub](https://github.com/) website. They can be used with zero experience.

To install the scripts, you will need a userscript manager, such as [Violentmonkey](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) (Firefox) or [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) (Chromium).

>> **Chromium Users:**  
>> Make sure Tampermonkey can actually *run* userscripts:  
>> - Go to `chrome://extensions/` (or equivalent)  
>> - Click **Details** under Tampermonkey  
>> - Enable **“Allow access to file URLs”**, **“Allow User Scripts”** and **"Developer Mode"**, then hit **"Update"**
>>
>> Yes, this is a bit annoying, and yes, it's Google's fault, and no, I can't fix this.

---

### GitHub – Deletion Confirmation Auto-filler

This userscript is made to automate GitHub’s “Delete this repository” confirmation steps (There are WAY too many steps). It sequentially clicks through intermediate modals and auto-types the repository name in the final confirmation box. You still have to click the first and the last “Delete this repository” buttons yourself (no accidental nukes here).  

Install the Semi-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-delete-1.2.user.js))  
>> Only types in the text  

Install the Full-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-delete-1.6.user.js))  
>> Does everything between the first and last clicks

---

### GitHub - Auto-Reload if Pending Deployment ([install](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-reload-1.2.user.js))

This script will automatically reload the main repository page if it's pending deployment. That way it's easier to see when your website has updated.

---

## Shell Scripts (for git)

These scripts are used to automate tasks in your local git repository.

For each script we will assume that your path looks like this:  
- `~/GitHub/$author/$repo`

For example, my path for this repository is:  
- `~/GitHub/NikoboiNFTB/GitHub-Tools`

These are the paths that will be referenced throughout the README and guides.

For these scripts you're expected to have properly set up SSH, be familiar with `git`, as well as simple Linux commands such as `wget`, `chmod` and `cat`, and in general know what you're doing.

To run any script, enter `./script.sh` in the terminal, or double click the file and choose "Run in Terminal." If it doesn't work, you need to allow it to be executable, using `chmod -f +x *.sh`  
>> Note: It is not recommended to use *.sh, because it will make every script executable, not just the one you want. (It's usually fine, though.)

Each install command is self cleaning, i.e. will delete itself and other files after execution.

---

### Git - Pull and Push Automations

These scripts can be used to automatically pull or add, commit and push changes for repositories.

#### [`pull.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/pull.sh) and [`push.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/push.sh)  
- Run inside `~/GitHub/$author/$repo`.  
- When run, they will automatically pull or push any changes.  
- Identical to running `git pull` or `git add .`, `git commit -m "Automated push"` and `git push`, respectively.  
  - Git commit message can be modified freely.

#### [`all-pull.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-pull.sh) and [`all-push.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-push.sh)  
- Run inside `~/GitHub/$author`.  
- When run, they will automatically run `./pull.sh` or `./push.sh` inside each repository.

#### [auto-pull.sh](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/auto-pull.sh) and [auto-push.sh](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/auto-push.sh)
- Run inside `~/GitHub/$author`.  
- 

#### [`setup.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup.sh)  
- Run inside `~/GitHub/$author`  
- This script is used to automatically setup `pull.sh`, `push.sh`, `all-pull.sh` and `all-push.sh` in your projects folder. It will place `all-pull.sh` and `all-push.sh` in the projects folder (~/GitHub/$author) and `pull.sh` and `push.sh` in each repository folder (~GitHub/$author/$repo)  
- You can set up everything automatically by simply running:  
  - `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup.sh && chmod -f +x setup.sh && ./setup.sh`  
- Everything this command does:  
  - Download, allow execution and execute `setup.sh` (separated by &&)  
  - `setup.sh` will download `pull.sh`, `push.sh`, `all-pull.sh` and `all-push.sh`  
  - Copy `pull.sh` and `push.sh` into every folder in the current directory.
  - Delete those two files, as well as `setup.sh` from the projects folder (they aren't needed there anymore).  
  - Grant every file permission to be executed.

>> PS. I will be making two new scripts called `auto-pull.sh` and `auto-push.sh` scripts that **don't require** `pull.sh` or `push.sh` in each repository folder (for those who want a cleaner setup, i.e. no junk files in the repos).

---

### Git - Cloning Repositories

Simple script that asks for a GitHub username and then creates a folder named after the GitHub username, and clones all the (public) repositories form that user. You can easily download it using:  
- `wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/clone.sh && chmod -f +x clone.sh`  
And run it using:  
- `./clone.sh`

---

### Git - Clone my Workflow
`wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/workflow.sh && chmod -f +x workflow.sh && ./workflow.sh && cd NikoboiNFTB`

---

### Git - Disable and Enable SSH

These scripts are used to, you guessed it, disable and enable SSH on your local machine, while keeping the same public key linked to your GitHub account.

#### [`disable-s.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/disable-s.sh) and [`enable-s.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/enable-s.sh)  
- Can be run from anywhere, doesn't matter. I recommend `$author`, though, so all the scripts are collected in one place.  

What the scripts do;  
- `./disable-s.sh`  
  - Makes a folder ~/.ssh.bak  
  - Moves `id_ed25519` and `id_ed25519.pub` from `~/.ssh` to `~/.ssh.bak`  
  - Removes all SSH keys using `ssh-add -D`
- `./enable-s.sh`  
  - Moves `id_ed25519` and `id_ed25519.pub` back from `~/.ssh.bak` to `~/.ssh`  
  - Some "just in case" permission stuff.  
  - Adds the SSH key using `ssh-add ~/.ssh/id_ed25519`  
  - Does **not** delete the `~/.ssh.bak` folder, though can easily be modified to do so.

>> Note: These are **not** made for ultra security, just a simple toggle switch.

---

## License

This project is licensed under the GNU General Public License v3.0 (GPLv3). See [LICENSE](LICENSE) for details.

Author: [Nikoboi](https://github.com/NikoboiNFTB)
