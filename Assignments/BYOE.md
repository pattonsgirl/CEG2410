# Bring Your Own Environment

At about the 5th time you setup a new server, you start thinking hard about ways you could script a default configuration.  

An actually worth the title [The Ultimate Guide to Mastering Dotfiles](https://www.daytona.io/dotfiles/ultimate-guide-to-dotfiles)

Your tasking: 

Build a dotfile repository that includes a script to complete the following tasks when executed:

- installs packages
- symbolically links a `gitconfig` file in your repository to `~/.gitconfig` in your user's home directory
- symbolically links an `bashrc` (AND OR `bash_profile`) file in your repository to `~/.bashrc` in your user's home directory
- symbolically links an `authorized_keys` file in your repository to `~/.ssh/config` in your user's home directory
- `vim` plugins to change default color scheme and for one of: file explorer OR to utilize git OR autocomplete

You are allowed to beg, borrow, steal, and use ChatGPT for this collection of taskings - however all information in files must be accurate to you and you must CITE WHAT YOU REFERENCED.  Especially if you are reusing a snippet that "belongs" to someone else.

Some sample dotfile repositories:
- [Awesome Dotfiles Collection](https://github.com/webpro/awesome-dotfiles)
- [Matt Kijowski's Dotfiles Repo](https://github.com/mkijowski/dotfiles/tree/master)

## Create a dotfiles repo

1. On your GitHub account, create a repository (public) named dotfiles
2. Clone your repository to a Linux system
     - can be an instance, a VM, WSL2, your machine, whatever - just keep it Linux based
3. In your repository, create a script to set things up.
     - `configure.sh`, `install.sh`, `runthis.sh`...
4. In the instructions below, you'll be adding to the utility of this script

## Package installs

Identify package names in the package installer you have.  Assuming you are you Ubuntu Linux, you have `apt`

- `dnsutils` (to get `dig`) 
- `nmap`
- `anaconda` OR `miniconda`
     - the one time install instructions (recommended to install it on your machine first, then add lines to script) - https://docs.anaconda.com/free/anaconda/install/linux/
     - silent mode install instructions (to avoid license prompting, etc) - https://docs.anaconda.com/free/anaconda/install/silent-mode/
- pick something fun:
     - [command line games](https://itsfoss.com/best-command-line-games-linux/)
     - [find humor in typos](https://github.com/nvbn/thefuck)
- [AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

In your script:

1. Check if running as `root`
2. Check for `apt` package manager
3. Install things above
4. Determine how to run remainder of taskings as non-root so that the right ownership is applied

## git configuration

Know what can be configured in `git config` - https://git-scm.com/book/sv/v2/Customizing-Git-Git-Configuration

Configure git to:
- set name & email
- set core editor to `vim`, `nano` or `emacs`
- default exclude commonly ignorable files / folders (`gitignore`) OR create a default commit message template
- set [`git` autocorrect](https://andycarter.dev/blog/auto-correct-git-commands)

1. Copy your `.gitconfig` to your git repository
2. Add to your script to create symbolic link to `~/.gitconfig`

## bash run commands (rc)

Add to your `.bashrc` file:
- Make two useful aliases
     - ["awesome" bash aliases](https://github.com/vikaskyadav/awesome-bash-alias)
     - [30 okay aliases](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html)
     - [70 more aliases](https://davidjguru.github.io/blog/linux-70-commands-aliases-for-everyday-life)
- Grab something cool from [The Ultimate B.A. .bashrc file](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)

If anything requires an additional packages, add it to your script's package installs

1. Copy your `.bashrc` to your git repository
2. Add to your script to create symbolic link to `~/.bashrc`

## ssh public keys - authorized keys

1. In your script, check if `~/.ssh` folder exists.  If not, create it.
2. Copy the `~/.ssh/authorized_keys` file to your repo, have script symbolically link it to `~/.ssh/authorized_keys`
3. Create an `~/.ssh/config` file with an entry to `fry.cs.wright.edu`  Symbolically link it to `~/.ssh/config`
     - use your w-number as your login name
     - be connected to WSU-Secure OR Wright State VPN

Matt Kijowski says "Remember me? Sync your GPG key rings."

## vim customizations

Do the below tasks on your system, adding commands to your script to complete the tasks automatically when the script is run.

1. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
2. Pick and [install](https://www.linode.com/docs/guides/vim-color-schemes/#how-to-change-vim-color-schemes) a [color scheme for vim](https://github.com/rafi/awesome-vim-colorschemes)
3. Pick and install a vim [improvement plugin](https://vimawesome.com/)
     - see [Red Hat's opinions](https://www.redhat.com/sysadmin/five-vim-plugins)
     - 
## Kidnapping Collections
Don't forget to **cite** where you grabbed things:
- [My "does the things" collection](https://github.com/pattonsgirl/dotfiles/tree/main)
- [Kijowski's better organized dotfiles](https://github.com/mkijowski/dotfiles)
- [Classmate's Collection of Scripts - Modular style](https://github.com/1blckhrt/dotfiles/tree/main)

## Submission

1. Demonstration
     - either during class session OR via a recording, prove that your script works on a fresh instance with user account
2. Deliverable
     - To Dropbox in Pilot, submit link to your dotfiles repository

