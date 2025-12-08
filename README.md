# GitHub-Tweaks

A collection of scripts and userscripts to automate GitHub maintenance and repository management.  
Each tool is written to make repetitive Git tasks slightly less soul-crushing.

---

## Userscripts (for web)

### GitHub – Deletion Confirmation Auto-filler

This userscript is made to automate GitHub’s “Delete this repository” confirmation steps (There are WAY too many steps). It sequentially clicks through intermediate modals and auto-types the repository name in the final confirmation box. You still have to click the first and the last “Delete this repository” buttons yourself (no accidental nukes here).  

Install the Semi-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/delete-confirm-autofill-1.2.user.js))  
>> Only types in the text  

Install the Full-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/delete-confirm-autofill-1.6.user.js))  
>> Does everything between the first and last clicks  

### GitHub - Auto-Reload if Pending Deployment ([install](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/auto-reload-if-pending-1.2.user.js))

This script will automatically reload the main repository page if it's pending deployment. That way it's easier to see when your website has updated.  

---

## Shell Scripts (for git)

For each script we will assume that your path looks like this:  
`~/GitHub/<user>/<repo>/`  
For example, my path would be:  
`~/GitHub/NikoboiNFTB/GitHub-Tools` (for this repository)  
These are the paths that will be referenced throughout the README.

For each script you will need to make the script executable:  
`chmod +x *.sh`  
>> Note: Using `*.sh` in the command itself is generally not recommended, as it will make every shell script in the current directory executable. Be precise, or be lazy, I won't judge.

### Git - Clone all repos

Simple script that creates a folder named after your GitHub username, and runs `git clone` all the repository names you add. You can install it using:  
`wget https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all/all-clone.sh`

### pull.sh and push.sh

Two scripts used to automatically pull or add, commit and push changes in the current repository. This doesn't speed up pull much, but it significantly speeds up commits, especially multiple commits in quick succession.

- You can easily install them into any repository simply by running:  
  - `wget https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/repo/pull.sh https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/repo/push.sh`

They can be used individually per repo, by calling them directly, using:  
- `./pull.sh`  
- `./push.sh`

They can also be ran from the parent folder using:
- ``  
- ``  

---

## 🧾 License
This project is licensed under the GNU General Public License v3.0 (GPLv3).

You are free to use, modify, and redistribute this software, provided that all copies and derivative works are also licensed under the GPLv3. See [LICENSE](LICENSE) for details.

---

Author: [Nikoboi](https://github.com/NikoboiNFTB)
