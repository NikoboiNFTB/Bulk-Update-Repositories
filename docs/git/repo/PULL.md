# 'pull'

Pulls remote changes to local repository.

## Table of Contents

- [Purpose](#purpose)
- [Usage](#usage)
- [Options](#options)
- [Examples](#examples)
- [Notes](#notes)
- [See Also](#see-also)

## Purpose

Replaces running the `git pull` command. Not a lot faster than just running `git pull`. This script exists just for parity with [`push`](/docs/git/repo/PUSH.md) and [`status`](/docs/git/repo/STATUS.md).

## Usage

Save the script to a path like `~/GitHub/$AUTHOR`. Then from inside `~/GitHub/$AUTHOR/$REPO` you can run the script by running;

```bash
../pull
```

List required arguments and their meanings.

## Options

| Option        | Description                 |
|---------------|-----------------------------|
| -h, --help    | Show help message           |
| -v, --verbose | Enable verbose output       |
| …             | …                           |

Include only options relevant to this script.

## Examples

Basic usage:

    ./SCRIPT_PATH arg1 arg2

With options:

    ./SCRIPT_PATH -v --force arg1 arg2

Provide 2–3 practical examples.

## Notes

- Any caveats or gotchas.
- Dependencies (environment variables, other scripts, binaries).
- Expected behavior in edge cases.

## See Also

- Link to related scripts: `[OTHER_SCRIPT.md](../path/to/OTHER_SCRIPT.md)`
- Reference workflow or documentation.
