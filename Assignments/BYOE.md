# Bring Your Own Environment

At about the 5th time you setup a new server, you start thinking hard about ways you could script a default configuration.  

Your tasking: 

Build a dotfile repository that includes a script to complete the following tasks when executed:

- installs packages
- symbolically links a `gitconfig` file in your repository to `~/.gitconfig` in your user's home directory
- symbolically links an `bashrc` (AND OR `bash_profile`) file in your repository to `~/.bashrc` in your user's home directory
- symbolically links an `authorized_keys` file in your repository to `~/.ssh/config` in your user's home directory
- `vim` plugins to change default color scheme and for one of: file explorer OR to utilize git OR autocomplete

## Create a dotfiles repo

1. On your GitHub account, create a repository (public) named dotfiles
2. Clone your repository to a Linux system
     - can be an instance, a VM, WSL2, your machine, whatever - just keep it Linux based
3. In your repository, create a script to set things up.
     - `configure.sh`, `install.sh`, `runthis.sh`...
4. In the instructions below, you'll be adding to the utility of this script

## Package installs

Identify package names in the package installer you have.  Assuming you are you Ubuntu Linux, you have `apt`

- `bind-tools`
- `nmap`
- `anaconda` OR `miniconda`
- pick something fun:
     - [command line games](https://itsfoss.com/best-command-line-games-linux/)
     - [find humor in typos](https://github.com/nvbn/thefuck)
- [AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

1. Check if running as `root`
2. Check for `apt` package manager
3. Install things above

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

If anything requires an additional package, add it to your package installs

1. Copy your `.bashrc` to your git repository
2. Add to your script to create symbolic link to `~/.bashrc`

## ssh public keys - authorized keys


1. If `~/.ssh` folder does not exist, create it
2. Copy the `authorized_keys` file to your repo, have script symbolically link it to `~/.ssh/authorized_keys`
3. Create an `config` file with an entry to `fry.cs.wright.edu`  Symbolically link it to `~/.ssh/config`

## vim customizations

1. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
2. Pick and [install](https://www.linode.com/docs/guides/vim-color-schemes/#how-to-change-vim-color-schemes) a [color scheme for vim](https://github.com/rafi/awesome-vim-colorschemes)
3. Pick and install a vim [improvement plugin](https://vimawesome.com/)
     - see [Red Hat's opinions](https://www.redhat.com/sysadmin/five-vim-plugins)

## Confirm it worked

1. Sign on to a fresh instance, clone your repo, run your installation script

