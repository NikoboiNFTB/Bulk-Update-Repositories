# GitHub-Tweaks

>> ⚠️ Unfinished ⚠️  
>> Will finish tomorrow.

A collection of scripts and userscripts to automate GitHub maintenance and repository management.  
Each tool is written to make repetitive Git tasks slightly less soul-crushing.

---

## Userscripts (for web)

These scripts are used to automate tasks on the [GitHub](https://github.com/) website. They can be used with zero experience.

To install the scripts, you will need a userscript manager, such as [Violentmonkey](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) (Firefox) or [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo) (Chromium).

>> **Chrome / Edge / Brave Users:**  
>> Make sure Tampermonkey can actually *run* userscripts:  
>> - Go to `chrome://extensions/` (or equivalent)  
>> - Click **Details** under Tampermonkey  
>> - Enable **“Allow access to file URLs”**, **“Allow User Scripts”** and **"Developer Mode"**, then hit **"Update"**
>>
>> Yes, this is a bit annoying, and yes, it's Google's fault, and no, I can't fix this.

---

### GitHub – Deletion Confirmation Auto-filler

This userscript is made to automate GitHub’s “Delete this repository” confirmation steps (There are WAY too many steps). It sequentially clicks through intermediate modals and auto-types the repository name in the final confirmation box. You still have to click the first and the last “Delete this repository” buttons yourself (no accidental nukes here).  

Install the Semi-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/delete-confirm-autofill-1.2.user.js))  
>> Only types in the text  

Install the Full-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/delete-confirm-autofill-1.6.user.js))  
>> Does everything between the first and last clicks

---

### GitHub - Auto-Reload if Pending Deployment ([install](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/auto-reload-if-pending-1.2.user.js))

This script will automatically reload the main repository page if it's pending deployment. That way it's easier to see when your website has updated.

---

## Shell Scripts (for git)

These scripts are used to automate tasks in your local git repository.

For each script we will assume that your path looks like this:  
- `~/GitHub/$author/$repo`

For example, my path for this repository would be:  
- `~/GitHub/NikoboiNFTB/GitHub-Tools`

These are the paths that will be referenced throughout the README.

For these scripts you're expected to have properly set up SSH, be familiar with `git`, as well as simple Linux commands such as `wget`, `chmod` and `cat`, and in general know what you're doing.

---

### Git - Pull and Push Automations

These scripts can be used to automatically pull or add, commit and push changes for repositories.

#### [`pull.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/pull.sh) and [`push.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/push.sh)  
- Place and run inside `~/GitHub/$author/$repo`.  
- When run, they will automatically pull or push any changes.  
- Identical to running `git pull` or `git add .`, `git commit -m "Automated push"` and `git push`.

#### [`all-pull.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-pull.sh) and [`all-push.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-push.sh)  
- Place and run inside `~/GitHub/$author`.  
- When run, they will automatically run `./pull.sh` or `./push.sh` inside each `$repo`.

#### [`setup.sh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup.sh)  
- Run inside `~/GitHub/$author`  
- This script is used to automatically setup `pull.sh`, `push.sh`, `all-pull.sh` and `all-push.sh` in your projects folder.  
- Setting everything up can be done automatically by simply running:  
  - `wget -q https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/setup.sh && chmod +x setup.sh && ./setup.sh`  
- Every single step this simple command does:  
  - Download, allow execution and execute `setup.sh` (separated by &&)  
  - `setup.sh` will download `pull.sh`, `push.sh`, `all-pull.sh` and `all-push.sh`  
  - Copy `pull.sh` and `push.sh` into every folder in the current directory, then delete those two files from the projects folder (they aren't needed there anymore).  
  - Give every file permission to be executed.

---

### Git - Cloning Repositories

Simple script that creates a folder named after your GitHub username, and runs `git clone` all the repository names you add. You can download it using:  
`wget -q https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/clone.sh && cat clone.sh`  
This command will show a guide right in the terminal.

---

### Git - Enable and Disable SSH

These scripts are used to, you guessed it, enable and disable SSH on your local machine, while keeping the public key linked to your GitHub account.

#### `disable-ssh.sh`

#### `enable-ssh.sh`

---

## 🧾 License
This project is licensed under the GNU General Public License v3.0 (GPLv3).

You are free to use, modify, and redistribute this software, provided that all copies and derivative works are also licensed under the GPLv3. See [LICENSE](LICENSE) for details.

Author: [Nikoboi](https://github.com/NikoboiNFTB)
