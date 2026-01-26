Check out https://open-vsx.org/

Add ts:
```bash
alias nemo='nemo . > /dev/null 2>&1 &'
```
to `~/.bashrc`

I need a couple of changes done:
Make it so that rather than hard-coding author, you have two options;
1. run the script like `bash script author repo ssh`, and it would use author, repo and ssh as author, repo and clone type.
2. Just run `bash script` or `./script` and it would run two read commands for repo and 
