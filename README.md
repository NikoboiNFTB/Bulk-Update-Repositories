⚠️ This repository is undergoing large changes. README.md files may not be accurate.

# GitHub-Tools

A collection of scripts and userscripts for automating GitHub maintenance and repository management.

Each tool exists to make repetitive Git tasks a little less tedious.

## Table of Contents

Each entry can be clicked for a detailed description of each script.

| Category | Script | Description |
| - | - | - |
| Single Repo Management | [`pull`](/docs/AUTOMATION.md) | Pull remote changes |
| Single Repo Management | [`push`](/docs/AUTOMATION.md) | Push local changes |
| Single Repo Management | [`status`](/docs/AUTOMATION.md) | View status |
| Bulk Repo Management | [`all-pull`](/docs/AUTOMATION.md) | Pull remote changes |
| Bulk Repo Management | [`all-push`](/docs/AUTOMATION.md) | Push local changes |
| Bulk Repo Management | [`all-status`](/docs/AUTOMATION.md) | View Status of current repo |
| Bulk Repo Management | [`ignore`](/docs/AUTOMATION.md) | Add files and folders to [`.git/info/exclude`](/.git/info/exclude) |
| Cloning Repositories | [`clone-repo`](/docs/CLONE.md) | Clone a repository |
| Cloning Repositories | [`clone-author`](/docs/CLONE.md) | Clone an author’s repos |
| SSH Management | [`disable-ssh`](/docs/SSH.md) | Disable your SSH key |
| SSH Management | [`enable-ssh`](/docs/SSH.md) | Enable your SSH key |
| Generic Utils | [`compare`](/docs/UTILS.md) | Compare files from my repos |
| Generic Utils | [`sort-file`](/docs/UTILS.md) | Sort contents of any file |
| Workflow | [`workflow`](/docs/WORKFLOW.md) | Copy my personal workflow |

## File Tree

This is the expected file structure for every single script I've published.

```text
.
└── GitHub
    ├── NikoboiNFTB
    │   ├── DeSlop
    │   │   └── *
    │   ├── GitHub-Tools
    │   │   └── *
    │   ├── IMDb-RePo
    │   │   └── *
    │   ├── nikoboinftb.github.io
    │   │   └── *
    │   ├── TMDB-RePo
    │   │   └── *
    │   ├── YouTube-Tweaks
    │   │   └── *
    │   ├── .disable-ssh
    │   ├── .enable-ssh
    │   ├── all-pull
    │   ├── all-push
    │   ├── all-status
    │   ├── compare
    │   ├── ignore
    │   ├── ignore-wipe
    │   ├── pull
    │   ├── push
    │   └── status
    ├── clone-author
    ├── clone-author-turbo
    ├── clone-repo
    └── workflow
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
