# Utility

Miscellanious utility scripts.

## Scripts

### [`compare`](/shell/utils/compare)

Compares the files in [this repository](https://github.com/NikoboiNFTB/GitHub-Tools/tree/main/shell) and [my website](https://github.com/NikoboiNFTB/nikoboinftb.github.io/tree/main/sh).

#### Usage

```bash
bash <(wget -qO- https://nikoboinftb.github.io/shell/utils/compare)
```
### [`find-file`](/shell/utils/find-file)

Simple to use tool to find a file or folder anywhere in the current directory, while allowing you to ignore directories.

#### Usage

Simply save the script in any folder and run:

```bash
bash find-file file1 file2 -i dir1 dir2
```

For example, if I want to find all `README*` files, except from my repositories:

```bash
bash find-file README* -i NikoboiNFTB
```

Much easier than running;

```bash
find . \( -name "README.md" -o -name "README.txt" -o -name "README" \) | grep -Ev "NikoboiNFTB"
```

### [`sort`](/shell/utils/sort)

Sort any file alphabetically.

#### Usage

Save the script and run it anywhere:

```bash
bash sort <file>
```

You can also add it to some place like `$HOME`, so you can run it from anywhere:

```bash
user@pc:~/this/is/a/path/to/a/folder$ ~/sort <file>
```

>> This is a general use version of the sort file from [NikoboiNFTB/DeSlop/block/sort](https://github.com/NikoboiNFTB/DeSlop/blob/main/block/sort)

## Installation

Run in the folder you want the script in;

```bash
wget https://nikoboinftb.github.io/shell/utils/*
```

### Power User Tip

Place any script in `/usr/local/bin/` for easy access anywhere:

```bash
sudo mv script /usr/local/bin/script
```

This will allow you to easily run the script as any other Linux command:

```bash
script
```

Very much recommended for scripts you use a lot in many different folders.

#### WARNING

Make sure you don't overwrite anything in `/usr/local/bin/`. You can easily make sure there isn't such a file by running;

```bash
cat /usr/local/bin/script
```

Or any such command:

```bash
script
```
