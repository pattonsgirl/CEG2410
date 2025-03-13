## Task 2

In your `dotfiles` repository, create a folder named `homefiles`

### bash aliases & run commands

For this task, you are going to toy with additional useful tools people recommend for `bash` environments.  In my opinion, when I make dotfiles they are how I want to sytlize my user environment.  Others would rather their custom options *append* or are `source`d separately from the default files in order to not overwrite existing changes.  In the tasking instructions below, I'm going to recommend some other pathways you can choose from to complete the end objective - adding customizations to the user's `bash` environment.

The neat part about symbolic linking is that if your dotfiles update, you can update them in your repository, then *pull* the changes.  The sym link will just point to the repo file

1. Explore some useful bash aliases to mimic or add to your bash environment:
    - Two useful aliases
        - ["awesome" bash aliases](https://github.com/vikaskyadav/awesome-bash-alias)
        - [30 okay aliases](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html)
        - [70 more aliases](https://davidjguru.github.io/blog/linux-70-commands-aliases-for-everyday-life)
    - Something cool from [The Ultimate B.A. `.bashrc` file](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)
2. **REQUIRED** pick one:
    - Edit your `~/.bashrc` file and add the chosen aliases / functions from step 1.
    - Create a `~/.bash_aliases` file and add the chosen aliases / functions from step 1.
    - Create a `~/.bash_ghusername` file and add the chosen aliases / functions from step 1.
3. Verify your added aliases / bash additions work by running `source <filename>` - install additional packages if required
4. Copy your bash customizations file to your `dotfiles` repository in `homefiles`
5. Write a script that:
    - **Optional** pick one:
        - [if needed] outputs to user packages that need to be installed for your `.bashrc` file
        - [if needed] checks if being run as sudo, installs additional packages needed for your `.bashrc` file
    - **REQUIRED** pick one:
        - copies or symbolically links the `.bashrc` file in your `dotfiles` repository to your user's home directory
            - yes, this means getting rid of, or better, moving (renaming) the original as a backup, and having the sym link named `~/.bashrc` be in its place
        - copies or symbolically links the `.bash_aliases` file in your `dotfiles` repository to your user's home directory
        - copies or symbolically links the `.bash_ghusername` file in your `dotfiles` repository to your user's home directory
        - **NOTE** if you pick one the last option, your script must append a `source filename` to the user's `~/.bashrc` file.  `~/.bashrc` already has an example that checks for `~/.bash_aliases` - you can mimic it
    - **REQUIRED**:
        - remind (prompt) the user to reload their environment (with `source` or by logging out and back on)
6. Add / copy the script to your `dotfiles` repository in `homefiles`
7. Add a README.md file to the `homefiles` folder with a description about what these files do and **citations**
    - if you used generative AI, you need to cite which was used and what the prompt was
    - markdown syntax for links is `[link descriptor](URL_HERE)` - provide a little description of what was used in the article / video

## Troubleshooting / Advice
A recovery `.bashrc` file is [here](bashrc) if you need it.  While testing, maybe name yours `new_bashrc` and try loading it into your shell (`source new_bashrc`) to check for errors because having it be your only `.bashrc`

If you are making changes locally (your host system using `bash` or you have WSL2 + Ubuntu) and you break something, causing `bash` to no longer keep a shell open - you can still edit the files via your file explorer.

If you are making changes on your AWS instance and you break comsthing causing `bash` to no longer keep a shell open, you should still be able to `sftp`.  You can then `get` the broken files, remove the likely culprits, then `put` the fixed files in the user profile.

## Submission

At each task due date, submit your repository link to the folder corresponding to the task number to Dropbox in Pilot.
