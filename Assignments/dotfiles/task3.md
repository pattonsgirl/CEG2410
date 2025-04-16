## Task 3

In your `dotfiles` repository, create a folder named `sys-installs`

### Package installs

For this task, you are going to do every admin's favorite thing - install software!  The below software should require multiple commands to install between dependencies and the software itself.

1. Pick **one** of the following packages in install for Ubuntu Linux:
    - Singularity
    - Ansible
    - Anaconda
    - CUDA
    - [AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. Write a script that
    - checks the effective user id (EUID) - if running as `root` the script may proceed, otherwise it exits and prompts the user that this script requires `sudo` or `root`
    - checks that the system package manager is `apt` (or `apt` is available on the system), otherwise it exits and prompts the user that this script uses the `apt` package manager
    - provides the user with information on what will be installed - allows the user to provide `y` for yes and proceeds or `n` for no and exits
    - checks if name of software or software (not each of its dependencies) exists - exits if software is found (or if software name is taken) and prompts the user that a name conflict occurred
        - ex. Let's say `aws` is a command that exists and outputs `You're awesome!` - but it isn't the `aws` tool you are about to install. Since the program name is already taken, your install would fail before accidentally changing system behavior
    - **silently** installs the software selected per instructions
        - ex. `sudo apt install apache2` will prompt me `y` / `n` before proceeding; `sudo apt install -y apache2` will assume "yes" as answer to all prompts and run non-interactively
    - prompts the user that install is complete and a command to run to try it
3. Add / copy the script to your `dotfiles` repository in `sys-installs`
4. Add a README.md file to the `sys-installs` folder with a description about what these file do and citations
    - if you used generative AI, you need to cite which was used and what the prompt was
    - markdown syntax for links is [link descriptor](URL_HERE) - provide a little description of what was used in the article / video


## Submission

At each task due date, submit your repository link to the folder corresponding to the task number to Dropbox in Pilot.
