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

## Submission

At each task due date, submit your repository link to the folder corresponding to the task number to Dropbox in Pilot.