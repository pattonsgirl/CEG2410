## Config Script

Setting up a new Linux environment to be how you want when you sign on is repetitive - so let's make a script! If using an AWS instance, install things relative to being the ubuntu user (or create a new user if you'd like).  WSL2 should also be a good place to fidget.

When scripting, it is recommended to try things in the terminal before creating a script using those commands.

Write a script (choice of bash, python, or Powershell) that does the following:

1. Installs packages: git, vim, python3, plus one of choice
    - [Ask Ubuntu - How do I write a shell script to install a list of applications?](https://askubuntu.com/questions/519/how-do-i-write-a-shell-script-to-install-a-list-of-applications)
    - [Reddit - What are some must have Linux sysadmin CLI tools?](https://www.reddit.com/r/sysadmin/comments/fia8de/what_are_some_must_have_linux_sysadmin_cli_tools/)
2. Customizes vim: add color scheme, change default colorization, add functionality with plugin of choice
    - If you choose to install a `vim` plugin manager, add comments to link to how to install it
    - Colorization - download color scheme and enable it: 
        - [`vim` color schemes - library](https://vimcolorschemes.com/)
        - [Base 16 color schemes - install notes](https://github.com/chriskempson/base16-vim)
        - [Base 16 color schemes - available schemes](https://github.com/chriskempson/base16-vim/tree/master/colors)
    - Other `vim` plugins - download plugin and enable it:
        - [RedHat - Top 5 `vim` plugins](https://www.redhat.com/sysadmin/five-vim-plugins)
3. (Bonus) Make a function for package installs and a function for your `vim` customizations, and a driver function that calls both.
    - [Linuxize - `bash` functions](https://linuxize.com/post/bash-functions/)
    - [OpenSource - Import functions and variables into Bash with the source command](https://opensource.com/article/20/6/bash-source-command)
4. (Bonus) Copies an `authorized_keys` file to `~/.ssh/`
    - [SSH - Authorized Keys File in SSH](https://www.ssh.com/academy/ssh/authorized-keys-file)
    - Hint: I recommend adding an `authorized_keys` file to your repository, then copying it to the correct location
        - Safety hint - maybe think about **appending** it to the existing one? [How to Combine Text Files Using the “cat” Command in Linux](https://www.howtogeek.com/278599/how-to-combine-text-files-using-the-cat-command-in-linux/)

## Submission:

Add your script to your GitHub repo, submit link to Dropbox in Pilot.