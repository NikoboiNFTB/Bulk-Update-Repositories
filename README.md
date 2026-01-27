⚠️ This repository is undergoing large changes. README.md files may not be accurate.

# GitHub-Tools

A collection of scripts and userscripts for automating GitHub maintenance and repository management.

Each tool exists to make repetitive Git tasks a little less tedious.

## Table of Contents

Each entry can be clicked for a detailed description of each script.

| Script | Description | Source | README |
| ------ | ----------- | ------ | ------ |
| `all-pull` | Pull remote changes | [Source](/shell/git/bulk/all-pull) | [AUTOMATION.md](/docs/AUTOMATION.md#all-pull) |
| `all-push` | Push local changes | [Source](/shell/git/bulk/all-push) | [AUTOMATION.md](/docs/AUTOMATION.md#all-push) |
| `all-status` | View Status of current repo | [Source](/shell/git/bulk/all-status) | [AUTOMATION.md](/docs/AUTOMATION.md#all-status) |
| `ignore` | Add entries to [`.git/info/exclude`](/.git/info/exclude) | [Source](/shell/git/bulk/ignore) | [AUTOMATION.md](/docs/AUTOMATION.md#ignore-and-ignore-reset) |
| `ignore-reset` | Reset [`.git/info/exclude`](/.git/info/exclude) | [Source](/shell/git/bulk/ignore-reset) | [AUTOMATION.md](/docs/AUTOMATION.md#ignore-and-ignore-reset) |
| `clone-author` | Clone an author’s repos | [Source](/shell/git/clone/clone-author) | [CLONE.md](/docs/CLONE.md#clone-author) |
| `clone-repo` | Clone a repository | [Source](/shell/git/clone/clone-repo) | [CLONE.md](/docs/CLONE.md#clone-repo) |
| `pull` | Pull remote changes | [Source](/shell/git/repo/pull) | [AUTOMATION.md](/docs/AUTOMATION.md#pull) |
| `push` | Push local changes | [Source](/shell/git/repo/push) | [AUTOMATION.md](/docs/AUTOMATION.md#push) |
| `status` | View status | [Source](/shell/git/repo/status) | [AUTOMATION.md](/docs/AUTOMATION.md#status) |
| `automation` | Setup all scripts automatically | [Source](/shell/git/setup/automation) | [AUTOMATION.md](/docs/AUTOMATION.md#installation) |
| `workflow` | Copy my personal workflow | [Source](/shell/git/setup/workflow) | [WORKFLOW.md](/docs/WORKFLOW.md#workflow)
| `disable-ssh` | Disable your SSH key | [Source](/shell/git/ssh/disable-ssh) | [SSH.md](/docs/SSH.md#disable-ssh) |
| `enable-ssh` | Enable your SSH key | [Source](/shell/git/ssh/enable-ssh) | [SSH.md](/docs/SSH.md#enable-ssh) |
| `sort` | Sort contents of any file | [Source](/shell/utils/sort) | [UTILS.md](/docs/UTILS.md#sort)

## File Tree

This is the expected file structure for every single script I've published.

```text
$HOME
└── GitHub
    ├── NikoboiNFTB
    │   ├── DeSlop
    │   │   ├── automation/
    │   │   │   ├── pull
    │   │   │   ├── push
    │   │   │   └── status
    │   │   └── *
    │   ├── GitHub-Tools
    │   │   ├── automation/
    │   │   │   ├── pull
    │   │   │   ├── push
    │   │   │   └── status
    │   │   └── *
    │   ├── IMDb-RePo
    │   │   ├── automation/
    │   │   │   ├── pull
    │   │   │   ├── push
    │   │   │   └── status
    │   │   └── *
    │   ├── nikoboinftb.github.io
    │   │   ├── automation/
    │   │   │   ├── pull
    │   │   │   ├── push
    │   │   │   └── status
    │   │   └── *
    │   ├── TMDB-RePo
    │   │   ├── automation/
    │   │   │   ├── pull
    │   │   │   ├── push
    │   │   │   └── status
    │   │   └── *
    │   ├── YouTube-Tweaks
    │   │   ├── automation/
    │   │   │   ├── pull
    │   │   │   ├── push
    │   │   │   └── status
    │   │   └── *
    │   ├── all-pull
    │   ├── all-push
    │   ├── all-status
    │   ├── compare
    │   ├── disable-ssh
    │   ├── enable-ssh
    │   ├── ignore
    │   └── ignore-reset
    ├── clone-author
    └── clone-repo
```

## Installation

You can install any one of the scripts into any folder by running:

```bash
wget https://nikoboinftb.github.io/sh/*
```

>> Fill in the path to the script

Or run the automation setup script. Run anywhere (the script self-corrects using `$HOME`, `mkdir -p` and `cd`):

```bash
bash <(wget -qO- https://nikoboinftb.github.io/sh/git/setup/automation)
```

The `automation` setup script also works as an update script.

>> Will setup my entire automation workflow [`/sh/git/`](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh/git/). See [File Tree](README.md#file-tree) for details.

## Contributing

Feel free to fork this repository and submit issues or pull requests if you have any suggestions or improvements. If you encounter any bugs or have feature requests, please open an issue.

## Credits

Created by **[Nikoboi](https://github.com/NikoboiNFTB/)**

Script logic fined tuned using **[ChatGPT](https://chatgpt.com/)**

## License

This project is licenced under the GNU General Public License V3. See [LICENSE](LICENSE) for details.
