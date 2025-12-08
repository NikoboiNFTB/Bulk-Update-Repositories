# GitHub-Tweaks

A collection of scripts and userscripts to automate GitHub maintenance and repository management.  
Each tool is written to make repetitive Git tasks slightly less soul-crushing.

---

## Userscripts (for web)

### GitHub – Deletion Confirmation Auto-filler

This userscript is made to automate GitHub’s “Delete this repository” confirmation steps (There are WAY too many steps). It sequentially clicks through intermediate modals and auto-types the repository name in the final confirmation box. You still have to click the first and the last “Delete this repository” buttons yourself (no accidental nukes here).  

Install the Semi-Auto Version [here](https://github.com/NikoboiNFTB/GitHub-Tweaks/raw/refs/heads/main/delete-confirm-autofill-1.2.user.js) (only types in the text)  

Install the Full-Auto Version [here](https://github.com/NikoboiNFTB/GitHub-Tweaks/raw/refs/heads/main/delete-confirm-autofill-1.6.user.js) (Does everything between the first and last clicks)

---

### GitHub - Auto-Reload if Pending Deployment ([install](https://github.com/NikoboiNFTB/GitHub-Tweaks/raw/refs/heads/main/auto-reload-if-pending-1.2.user.js))

This script will automatically reload the main repository page if it's pending deployment.  

---

## 🔧 Shell Scripts

### All-Repos-Commit.sh
Commits and pushes all local repositories with staged changes under the current directory.  
Useful when you maintain multiple small projects and want to sync them all at once.

Example usage:  
    ```<user>@<computer>:~/GitHub/NikoboiNFTB$ ./all-repos-commit.sh```

---

### All-Repos-Pull.sh
Pulls the latest commits from all repositories inside the current directory.

Example usage:  
    ```<user>@<computer>:~/GitHub/NikoboiNFTB$ ./all-repos-pull.sh```

---

### All-Repos-SSH.sh
Scans each subdirectory for a Git repository and changes the remote URL from HTTPS to SSH, for example:  
    HTTPS: `https://github.com/NikoboiNFTB/GitHub-Tweaks`  
to:  
    SSH: `git@github.com:NikoboiNFTB/GitHub-Tweaks.git`  

---

## 🧾 License
This project is licensed under the GNU General Public License v3.0 (GPLv3).

You are free to use, modify, and redistribute this software, provided that all copies and derivative works are also licensed under the GPLv3. See [LICENSE](LICENSE) for details.

---

Author: [Nikoboi](https://github.com/NikoboiNFTB)
