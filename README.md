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

These scripts are used to automate tasks in your local git repository.

For each script we will assume that your path looks like this:  
- `~/GitHub/<user>/<repo>/`  

We will user the terminology:  
- `~/GitHub/$author/$repo`

For example, my path would be:  
- `~/GitHub/NikoboiNFTB/GitHub-Tools` (for this repository)  

These are the paths that will be referenced throughout the README.

For each script you will need to make the script executable:  
- `chmod +x *.sh`  
>> Note: Using `*.sh` in the command itself is generally not recommended, as it will make every shell script in the current directory executable. Be precise, or be lazy, I won't judge.

For these scripts you're expected to have set up SSH, be familiar with `git`, `wget`, `chmod`, and other basic Linux commands, and in general know what you're doing.

### Pull and Push Automations

These scripts can be used to automatically pull or add, commit and push changes for repositories.

The scripts included are:  
- `pull.sh`  
  - Run inside `~/GitHub/<user>/<repo>`.  
  - When run, it will automatically pull any changes locally. This alone does not speed up your workflow. However, using it in combination with `all-pull.sh` will.  
  - Identical to running `git pull`.  
- `push.sh`  
  - Run inside `~/GitHub/<user>/<repo>`.  
  - Same as pull.sh, but for git push. This one, however, can save significant amounts of time even while working on a single repository, as you can just do "Up Arrow + Enter" to automatically push your changes.  
  - Identical to running `git add .`, `git commit -m "Automated push"` and `git push`.  
- `all-pull.sh`  
  - Run inside `~/GitHub/<user>`.  
  - When run, it will automatically run the `pull.sh` inside each `<repo>`.  
- `all-push.sh`  
  - Run inside `~/GitHub/<user>`.  
  - When run, it will automatically run `pull.sh` inside each `<repo>`.  
- `setup.sh`  
  - placeholder

- You can easily install them into any repository simply by running:  
  - `wget https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/repo/pull.sh https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/repo/push.sh`  
  In `~/GitHub/<user>`

They can be used individually per repo, by calling them directly, using:  
- `./pull.sh`  
- `./push.sh`

They can also be ran from the parent folder using:
- ``  
- ``  

### Git - Clone all repos

Simple script that creates a folder named after your GitHub username, and runs `git clone` all the repository names you add. You can download it using:  
`wget https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/all/all-clone.sh`  
Then just make changes and run it. You can read its guide by running:  
`cat all-clone.sh`  
>> The guide will be at the end.

---

## 🧾 License
This project is licensed under the GNU General Public License v3.0 (GPLv3).

You are free to use, modify, and redistribute this software, provided that all copies and derivative works are also licensed under the GPLv3. See [LICENSE](LICENSE) for details.

---

Author: [Nikoboi](https://github.com/NikoboiNFTB)







Clone all repos into a directory named after the username

Here's how to setup efficiently for your own use (step-by-step):

Step 1. Go to your repositories at https://github.com/$author?tab=repositories

Step 2. Extract all links using the filter "https://github.com/$author/" using Link Gopher

Step 3. Paste all the links anywhere using your favorite text editor. I like VSCodium for its seek and destroy functionality.
        Step 1. Use VSCodium's "Ctrl + F" tool to search for "https://github.com/$author/"
        Step 2. Hit enter until it's removed all the links, leaving only the repository name.

Step 4. Copy the repository names and paste the under repos=(). Don't forget to change author="" to your GitHub username.

Step 5. Run it. You will need to make it executable using `chmod +x all-clone.sh`.
