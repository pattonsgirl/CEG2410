# Package Managers

> A package manager is a tool that allows users to install, remove, upgrade, configure and manage software packages on an operating system. The package manager can be a graphical application like a software center or a command line tool - [It's Foss](https://itsfoss.com/package-manager/)

> A package is essentially an archive file containing the binary executable, configuration file and sometimes information about the dependencies - [It's Foss](https://itsfoss.com/package-manager/)

## Linux

- RPM (Red Hat Package Manager)
    - `yum`
    - `dnf`
- DEB (Debian packaging format)
    - [Install a `.deb` file with `dpkg`](https://itsfoss.com/install-deb-files-ubuntu/)
    - [Building binary deb packages: a practical guide](https://www.internalpointers.com/post/build-binary-deb-package-practical-guide)
    - `apt` / `apt-get` repositories
        - an `APT` repository is a network server or local directory containing `deb` packages & metadata files readable by `apt` tools
        - [`apt` Command in Linux](https://linuxize.com/post/how-to-use-apt-command/)
        - [How To Add Apt Repository In Ubuntu](https://linuxize.com/post/how-to-add-apt-repository-in-ubuntu/)
- `Snap` 
    - [It's FOSS - Advantages of snaps](https://itsfoss.com/install-snap-linux/)
    - A `.snap` package for the Ubuntu Core system contains all its dependencies.
    - Automatic Updates: Updates to a snap are delivered automatically daily, and reach out to everyone irrespective of the base OS.
    - One snap for everything: be it a desktop, server, robot, or cloud.
    - Different release availability: A snap can be maintained in the stable release, beta versions, and daily build at the same time and you can switch between each other whenever you want.
    - Security: Snaps run in a sandboxed environment, isolated from the rest of your system.
    - [How to use `snap`](https://itsfoss.com/use-snap-packages-ubuntu-16-04/)
    - [Creating a snap](https://snapcraft.io/docs/creating-a-snap)
- `Flatpak` 
    - [It's FOSS - What is `flatpak`?](https://itsfoss.com/what-is-flatpak/)
    - [Installing & Using `flatpak`](https://itsfoss.com/flatpak-guide/)
    - [in contrast to snap, `flatpak`](https://itsfoss.com/flatpak-vs-snap/):
        - focuses on desktop experience
        - packages do not update automatically
        - sandboxes by default
        - does not need admin privileges to install application
    - [Building your first `Flatpak`](https://docs.flatpak.org/en/latest/first-build.html)

## Mac 

- `Homebrew` (also works in Linux)
    - [Homebrew `install` & essentials](https://brew.sh/)
    - [Create a brew / formula](https://docs.brew.sh/Formula-Cookbook)
- `Nix` (also works in Linux / WSL2 / Docker)
    - [Install Nix](https://nixos.org/download.html)
    - [Nix basics](https://nixos.org/guides/ad-hoc-developer-environments.html)
    - [How Nix works](https://nixos.org/guides/how-nix-works.html)

## Windows 

- `winget` - Windows Package Manager
    - [Use the `winget` tool to install and manage applications](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
    - [Submit your manifest to the Windows Package Manager repository](https://learn.microsoft.com/en-us/windows/package-manager/package/repository)
- `Chocolately`
    - [`Chocolatey` - Software Management for Windows](https://docs.chocolatey.org/en-us/)
    - [Install `chocolately`](https://chocolatey.org/install)
    - [`chocolately` - Create Packages](https://docs.chocolatey.org/en-us/create/create-packages)

# Deployment Tools

## Ansible

## FOG
