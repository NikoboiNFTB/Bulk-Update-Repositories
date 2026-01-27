⚠️ This repository is undergoing large changes. README.md files may not be accurate.

# GitHub-Tools

A collection of scripts and userscripts for automating GitHub maintenance and repository management.

Each tool exists to make repetitive Git tasks a little less tedious.

## Table of Contents

Each entry can be clicked for a detailed description of each script.

| Script | Description | Source | README |
| ------ | ----------- | ------ | ------ |
| `all-pull` | Pull remote changes | [Source](/shell/git/bulk/all-pull) | [README](/docs/AUTOMATION.md#all-pull) |
| `all-push` | Push local changes | [Source](/shell/git/bulk/all-push) | [README](/docs/AUTOMATION.md#all-push) |
| `all-status` | View Status of current repo | [Source](/shell/git/bulk/all-status) | [README](/docs/AUTOMATION.md#all-status) |
| `ignore` | Add entries to [`.git/info/exclude`](/.git/info/exclude) | [Source](/shell/git/bulk/ignore) | [README](/docs/AUTOMATION.md#ignore-and-ignore-reset) |
| `ignore-reset` | Reset [`.git/info/exclude`](/.git/info/exclude) | [Source](/shell/git/bulk/ignore-reset) | [README](/docs/AUTOMATION.md#ignore-and-ignore-reset) |
| `clone-author` | Clone an author’s repos | [Source](/shell/git/clone/clone-author) | [README](/docs/CLONE.md#clone-author) |
| `clone-repo` | Clone a repository | [Source](/shell/git/clone/clone-repo) | [README](/docs/CLONE.md#clone-repo) |
| `pull` | Pull remote changes | [Source](/shell/git/repo/pull) | [README](/docs/AUTOMATION.md#pull) |
| `push` | Push local changes | [Source](/shell/git/repo/push) | [README](/docs/AUTOMATION.md#push) |
| `status` | View status | [Source](/shell/git/repo/status) | [README](/docs/AUTOMATION.md#status) |
| `automation` | Setup all scripts automatically | [Source](/shell/git/setup/automation) | [README](/docs/AUTOMATION.md#installation) |
| `workflow` | Copy my personal workflow | [Source](/shell/git/setup/workflow) | [README](/docs/WORKFLOW.md#workflow)
| `disable-ssh` | Disable your SSH key | [Source](/shell/git/ssh/disable-ssh) | [README](/docs/SSH.md#disable-ssh) |
| `enable-ssh` | Enable your SSH key | [Source](/shell/git/ssh/enable-ssh) | [README](/docs/SSH.md#enable-ssh) |
| `sort` | Sort contents of any file | [Source](/shell/utils/sort) | [README](/docs/UTILS.md#sort)

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

You can install any of the scripts into each folder by running:

```bash
wget https://github.com/NikoboiNFTB/GitHub-Tools/tree/main/shell/*
```

>> Replace `*` with the path to the file you want.

Or run the automation setup script:

```bash
bash <(wget -qO- https://nikoboinftb.github.io/sh/git/setup/automation)
```

## Contributing

Feel free to fork this repository and submit issues or pull requests if you have any suggestions or improvements. If you encounter any bugs or have feature requests, please open an issue.

## Credits

Created by **[Nikoboi](https://github.com/NikoboiNFTB/)**

Script logic fined tuned using **[ChatGPT](https://chatgpt.com/)**

## License

This project is licenced under the GNU General Public License V3. See [LICENSE](LICENSE) for details.
