## Task 1

### Create a dotfiles repo

1. On your GitHub account, create a **public** repository named `dotfiles`
2. Clone your repository to a Linux system
     - can be an AWS instance, a VM, WSL2, your machine, whatever - just keep it Linux based to begin

### Customize `vim`

1. In your `dotfiles` repository, create a folder named `vim-config`
2. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
3. Add to your `.vimrc` file instructions to use Vundle and refer to plugins (next steps)
4. Add  [your choice of a color scheme for vim via Vundle](https://vimawesome.com/?q=colorscheme)
    - my fav:
         - [jellybeans](https://vimawesome.com/plugin/jellybeans-vim)    
5. Add your choice of a vim [improvement plugin via Vundle](https://vimawesome.com/) (can be anything - just not a colorscheme)
     - see [Red Hat's opinions](https://www.redhat.com/sysadmin/five-vim-plugins)
     - my favs:
          - [indent-guides](https://vimawesome.com/plugin/indent-guides)
          - [fugitive](https://vimawesome.com/plugin/fugitive-vim)
          - [youcompleteme](https://vimawesome.com/plugin/youcompleteme)
               - may throw errors depending on `vim` version
6. At the end of the `.vimrc` set your colorscheme.  Example: `colorscheme jellybeans`
7. Install your Vundle plugins in your `.vimrc`
```
vim +PluginInstall +qall
```
8. Copy your `.vimrc` file to your `dotfiles` repository in the folder `vim-config`
9. Write a script that in your `dotfiles` repository that:
    - copies the `.vimrc` file from your repository folder to your user's home directory
        - we are assuming your repository is already cloned
    - installs `Vundle` if `~/.vim/bundle/Vundle.vim` does not exist
    - installs your `vim` setup per your `.vimrc` contents
10. Test that your script works.  Leave in comments or in a separate `README.md` in your `vim-config` folder notes on citations

## Submission

At each task due date, submit your repository link to the folder corresponding to the task number to Dropbox in Pilot.
