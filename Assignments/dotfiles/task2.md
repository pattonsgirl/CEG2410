## Task 2

In your `dotfiles` repository, create a folder named `homefiles`

### bash run commands (`.bashrc`)

1. Edit your `.bashrc` file with:
    - Two useful aliases
        - ["awesome" bash aliases](https://github.com/vikaskyadav/awesome-bash-alias)
        - [30 okay aliases](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html)
        - [70 more aliases](https://davidjguru.github.io/blog/linux-70-commands-aliases-for-everyday-life)
    - Something cool from [The Ultimate B.A. `.bashrc` file](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)
2. Verify your added aliases / bash additions work - install additional packages if required
3. Copy your `.bashrc` file to your `dotfiles` repository in `homefiles`
4. Write a script that:
    - **Optional**, pick one:
        - [if needed] outputs to user packages that need to be installed for your `.bashrc` file
        - [if needed] checks if being run as sudo, installs additional packages needed for your `.bashrc` file
    - symbolically links the `.bashrc` file in your `dotfiles` repository to your user's home directory
    - reminds the user to reload their environment (with `source` or by logging out and back on)
5. Add / copy the script to your `dotfiles` repository in `homefiles`

A recovery `.bashrc` file is [here](bashrc) if you need it.  While testing, maybe name yours `new_bashrc` and try loading it into your shell (`source new_bashrc`) to check for errors because having it be your only `.bashrc`

## Submission

At each task due date, submit your repository link to the folder corresponding to the task number to Dropbox in Pilot.
