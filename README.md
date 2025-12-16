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
- Only types in the text box.

Install the Full-Auto Version ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-delete-1.6.user.js))  
- Handles everything between the first and last click.



### GitHub - Auto-Reload if Pending Deployment

Reloads the repository page automatically when the project is in a “pending deployment” state. Useful for GitHub Pages development.

 Install it ([here](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/userscript/git-reload-1.2.user.js))



## Shell Scripts (for git)

These scripts automate local Git tasks. Each file is a bash script. The extension `.sh` has been stripped for cleanliness.

- All examples assume this directory structure:
  - `~/git/$author/$repo`
- Example:
  - `~/git/NikoboiNFTB/GitHub-Tools`
- Use differing paths on your own accord.

You should have a basic understanding of SSH, Git, and simple Linux commands (`wget`, `chmod`, `./` etc.). You *can* use these without knowing what you're doing, but no sane person will ever recommend you do that.

Run scripts with `./script` or double clicking them. If it fails, make it executable with `chmod +x script`.

>> Note: In install commands my own domain, [nikoboi.dev](https://nikoboi.dev/), will be used over the [github raw](https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/) domain. This is for link shortening and clarity. The github link is ridiculously long.  
>>
>> You're right to be sceptical about this, but you can easily confirm the files are identical by running:  
>> - `diff <(wget -qO- https://nikoboi.dev/sh/pull) <(wget -qO- https://raw.githubusercontent.com/NikoboiNFTB/GitHub-Tools/refs/heads/main/shell/push)`  
>>
>> This example will highlight the differences between the `pull` and `push` files. A blank result means they're identical.  
>> - I of course also automated this, which you can do by running:  
>>   - `bash <(wget -qO- https://nikoboi.dev/sh/compare)`  
>>
>> The domain [nikoboi.dev](https://nikoboi.dev/) is active under my GitHub Pages repository, and its [/sh/](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh) folder can be audited.  
>>
>> The scripts themselves will always call the github.com domain, because there cleanliness isn't as important.



### Git - Pull/Push Automation

- [`all-pull`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-pull)  
- [`all-push`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/all-push)  
  - Run in `~/git/$author`.  
  - Pulls or pushes all repositories at once.  
  - Must be run in the projects folder.  
- [`pull`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/pull)  
- [`push`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/push)  
  - Run in `~/git/$author/$repo`.  
  - Only pulls or pushes one repository, the one it's run in.  
  - Can be run in any repository with `../pull` if it's placed in the projects folder.

Install command:  
- `bash <(wget -qO- https://nikoboi.dev/sh/setup-auto)`



### Git - Clone Repositories

#### `clone`: Clone all public repos from any GitHub user.

- Download and allow execution command:  
  - `wget -q https://nikoboi.dev/sh/clone && chmod +x clone`  
- Run command:  
  - `./clone`

Can be run however many times you want to clone every author's repositories you want. Sky is the limit... and your network.

>> Note: Cloning many or large repositories can take a long time.

To copy my personal workflow, you can just run:  
- `bash <(wget -qO- https://nikoboi.dev/sh/workflow)`

#### `clone-repo`: Clone a single specified repository.

- Download and allow execution command:  
  - `wget -q https://nikoboi.dev/sh/clone-repo && chmod +x clone-repo`  
- Run command:  
  - `./clone-repo`

Can be run however many times you want. Sky is the limit.

>> Note: Cloning many or large repositories can take a long time.

To copy my personal workflow, you can just run:  
- `bash <(wget -qO- https://nikoboi.dev/sh/workflow)`



### Git - Disable and Enable SSH

These scripts are used to, you guessed it, disable and enable SSH on your local machine, while keeping the same public key linked to your GitHub account.

>> Note: These scripts are for convenience, not high-security.  
>> If security is what you want, delete the key from your GitHub account.  
>>
>> They can, however, be hidden for a little bit of extra feelgood.  
>> Just prefix the file name with a .

- [`disable-ssh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/disable-ssh)  
  - Makes a folder ~/.ssh.bak  
  - Moves `id_ed25519` and `id_ed25519.pub` from `~/.ssh` to `~/.ssh.bak`  
  - Removes all SSH keys using `ssh-add -D`  
- [`enable-ssh`](https://github.com/NikoboiNFTB/GitHub-Tools/raw/refs/heads/main/shell/enable-ssh)  
  - Moves `id_ed25519` and `id_ed25519.pub` back from `~/.ssh.bak` to `~/.ssh`  
  - Adds the SSH key using `ssh-add ~/.ssh/id_ed25519`  
  - Deletes `~/.ssh.bak`

The scripts are noth path-bound like the others, so feel free to install them wherever you want.

Install command:  
- `bash <(wget -qO- https://nikoboi.dev/sh/setup-ssh)`



### Git - Status

- `all-status`  
  - Runs `git add .` and `git status` in every repository  
- `status`  
  - Runs `git add .` and `git status` in the current repository.

Included in `setup-auto`



## License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**. See [LICENSE](LICENSE) for details.

Author: [Nikoboi](https://github.com/NikoboiNFTB)
