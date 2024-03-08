# Bring Your Own Environment

At about the 5th time you setup a new server, you start thinking hard about ways you could script a default configuration.  

Over time, you'll also have packages you want set up just so, an ever growing list of public keys to connect to your admin account, and all sorts of other things.

Your tasking: write a dotfile script that completes the following when executed:

- symbolically links an `authorized_keys` file in your repository to `~/.ssh/config` in your user's home directory
- changes the default color scheme in vim
- vim plugin for either file explorer OR to utilize git
- symbolically links a `gitconfig` file in your repository to `~/.gitconfig` in your user's home directory
- packages - must run as admin
     - python
     - pip
     - java JDK
     - update stuff / upgrade
     - container managers 
- aliases
    - `ls -lah` to `ls` append to the end of .bashrc
    - common aliases