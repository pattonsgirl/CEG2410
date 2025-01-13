# Project 1 - dotfiles

At about the 5th time you setup a new server, you start thinking hard about ways you could script a default configuration.

`dotfiles` are a collection of files, usually in a hidden directory, that admins bring to their account on new systems.  They include a collective mix of files and scripts that need to happen "every time" their account is getting setup or a server needs configured in a certain way.

An actually worth the title [Ultimate Guide to Mastering Dotfiles](https://www.daytona.io/dotfiles/ultimate-guide-to-dotfiles)

You are allowed to beg, borrow, steal, and use ChatGPT for this collection of taskings - however all information in files must be accurate to you and you must CITE WHAT YOU REFERENCED.  Especially if you are reusing a snippet that "belongs" to someone else.  As written in [this article](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) - Dotfiles Are Meant to Be Forked

Some sample dotfile repositories:
- [Awesome Dotfiles Collection](https://github.com/webpro/awesome-dotfiles)
- [Matt Kijowski's Dotfiles Repo](https://github.com/mkijowski/dotfiles/tree/master)
- [My "does the things" collection](https://github.com/pattonsgirl/dotfiles/tree/main)
- [1blckhrt's Collection of Scripts - Modular style](https://github.com/1blckhrt/dotfiles/tree/main)

This project will be split up and have tasks due at different points in the semester.

## Task 1

### Create a dotfiles repo

1. On your GitHub account, create a **public** repository named `dotfiles`
2. Clone your repository to a Linux system
     - can be an AWS instance, a VM, WSL2, your machine, whatever - just keep it Linux based to begin

### Customize `vim`

1. In your `dotfiles` repository, create a folder named `vim-config`
1. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
2. [Install](https://www.linode.com/docs/guides/vim-color-schemes/#how-to-change-vim-color-schemes) [your choice of a color scheme for vim](https://github.com/rafi/awesome-vim-colorschemes)
    - my fav:
         - [jellybeans](https://vimawesome.com/plugin/jellybeans-vim)    
3. Install your choice of a vim [improvement plugin](https://vimawesome.com/)
     - see [Red Hat's opinions](https://www.redhat.com/sysadmin/five-vim-plugins)
     - my favs:
            - [YouCompleteMe](https://vimawesome.com/plugin/youcompleteme)
                - This plugin with make you feel torn about the benefits of autocomplete.  Make sure you also know how to disable it
            - [fugitive](https://vimawesome.com/plugin/fugitive-vim)
4. Copy your `.vimrc` file to your `dotfiles` repository in `vim-config`
5. Write a script that
    - copies the `.vimrc` file from your repository to your user's home directory
    - installs `Vundle` if `~/.vim/bundle/Vundle.vim` does not exist
6. Add / copy the script to your `dotfiles` repository in `vim-config`

## Task 2 - DRAFT (NOT FINALIZED)

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
    - outputs as text to the user OR installs additional packages needed for your `.bashrc` files
    - symbolically links the `.bashrc` file in your `dotfiles` repository to your user's home directory
5. Add / copy the script to your `dotfiles` repository in `homefiles`

### SSH files

Note: people do not highly recommend adding `config` files to GitHub as you are informing "people" what servers you connect to, what the user name is, where your private key is located if they get access to your physical system... but this is to practice the concepts.  No tin foil hats needed here.

1. Add a public key used to authenticate to systems or GitHub and add it to the `authorized_keys` file in the `.ssh` folder of your user's home directory.
2. Copy your `.authorized_keys` file to your `dotfiles` repository in `homefiles`
3. Attempt an `ssh` connection to `fry.cs.wright.edu`
    - use your w-number as your login name
    - be connected to WSU-Secure OR Wright State VPN
4. Create an entry in your `config` file in your `.ssh` folder with an alias for the connection
5. Copy your `config` file to your `dotfiles` repository in `homefiles`
6. Write a script that:
    - creates a `.ssh` folder in your user's home directory if it does not exist
    - symbolically links the `authorized_keys` file in your `dotfiles` repository to your user's `.ssh` folder in their home directory
    - symbolically links the `config` file in your `dotfiles` repository to your user's `.ssh` folder in their home directory
7. Add / copy the script to your `dotfiles` repository in `homefiles`

Matt Kijowski says "Remember me? Sync your GPG key rings."

## Task 3 - DRAFT (NOT FINALIZED)

### Package installs

1. Install ONE of the following for Linux:
    - singularity
    - ansible
    - Anaconda
    - CUDA
    - [AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. Write a script that
    - checks if running as `root` before proceeding (terminates if not root)
    - checks if `apt` is system package manager
    - checks if the package / any downloads already exist
    - installs the package selected
3. Add / copy the script to your `dotfiles` repository in `server-installs`

## Task 4 - DRAFT (NOT FINALIZED)

### Polish & documentation

1. Make adjustments to task implementation per feedback given.
2. Add a `README.md` to your `dotfiles` repository that details:
    - how to clone & use
    - collection features
    - TODO notes of desired improvements

## Task Submissions

At each task due date, submit the link to the folder corresponding to the task number to Dropbox in Pilot.

