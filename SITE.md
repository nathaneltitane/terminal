# Site

Every section of [terminal.me](https://terminal.me). `tools/terminal-site` builds the page from this file. Each `##` section starts with a comment that sets its page id, icon and heading, and its first paragraph is the lead. `- **Title.** text` lines become points and `1. **Title.** text` lines steps, a `<!-- table class -->` comment sets the class of the table below it, and a `<!-- gallery class -->` comment turns the images and video links below it into one gallery, the title of a single image setting its figure class. A `<!-- video -->` comment turns the link below it into a looping video. A `<!-- include name -->` comment places content read from the scripts, a paragraph made of links ending in › becomes a more link, and `@NAME@` placeholders are filled with counts read from the scripts.

## Overview

<!-- overview | orange | OVERVIEW // SHELL SCRIPTS, TEMPLATES, DOTFILES AND UTILITIES -->

Terminal is a collection of shell scripts, templates, dotfiles and utilities to make your Linux based system experience a breeze.

- **One setup.** `bash terminal` runs every module in order: python, pipx, storage, mounts, files, home, git, shell, superuser, themes, applications, KRunner and the boot theme. Each module also runs alone with its own option.
- **Shell everywhere.** Dotfiles, aliases and functions are linked into `~/.local/bin`, for the user and for a root shell alike.
- **Functions as commands.** Every shell function is linked to `run`, so it starts from KRunner or any launcher like a real command.
- **Utilities.** Scripts for Android devices, backups, ssh, drives, desktops, rendering and more, each answering `-h` with its usage and options.
- **Service repository.** Other projects download their files from Terminal: Dextop takes its container images, Termux packages, shell and interface files from here.
- **Built on Frobulator.** Every script reports its steps the same way and fetches the latest Frobulator on start.
- **Reversible.** `bash terminal -n` removes the shell files, links and passwordless sudo again.

The Termux packages are uploaded unchanged from the official Termux GitHub repository and updated regularly. Only their names are changed, for easy reference in the scripts and projects that use them.

## Install

<!-- install | amber | INSTALL // ONE COMMAND, EVERY MODULE -->

`terminal` sets up a Debian, Ubuntu or Fedora based system: Linux based systems, Windows Subsystem for Linux, Chrome OS and Android storage alike.

Fetch the setup script and run it. It escalates through sudo on its own and fetches the latest Frobulator first.

```
curl -s -L get.trmnl.me/terminal > terminal && bash terminal
```

Without an option every module runs. Pick one module with its option instead, for example `bash terminal -m` for the drive mounts or `bash terminal -s` for the shell files.

<!-- include modules -->

## Shell

<!-- shell | yellow | SHELL // DOTFILES, SUPERUSER AND KRUNNER -->

`bash terminal -s` links the dotfiles, aliases and functions into `~/.local/bin` and the home directory, for the user and the superuser.

### Superuser

The shell setup links the dotfiles of the superuser (`.bashrc`, `.bash_aliases`, `.bash_functions` ...) to the files of the user in `~/.local/bin`. Each file loads Frobulator and the function files from the folder behind its link, so a root shell gets every function, alias and script of the user:

```
sudo -i
```

- **Aliases.** Aliases also work after sudo: `sudo <alias>`.
- **Functions.** Functions need a root shell: sudo only runs programs.
- **Passwordless sudo.** Set in its own file, `/etc/sudoers.d/<user>`, rewritten on each run so it never repeats.
- **Older versions.** Lines appended to `/etc/sudoers` by earlier versions are removed once the result passes the sudoers check.

### KRunner

KRunner only runs executables on the PATH. The shell setup links every function name in `~/.local/bin` to `run`, so a function is typed in KRunner like any command:

```
weather
```

- **Name or argument.** `run` takes the function from the name it was called by, or from its first argument: `run weather`.
- **Without a terminal.** Launched from KRunner, it reopens itself in Konsole or the default terminal, loads the functions of the user, runs the function and waits for enter before closing.
- **In a terminal.** It runs in place.
- **Real commands.** Names that are already real commands (`ssh`, `who` ...) get no link.
- **Uninstall.** Removes every link to `run`.

## Mounts

<!-- mounts | green | MOUNTS // LABELLED DRIVES AT BOOT -->

Drives labelled `internal` and `external` are mounted at boot through `/etc/fstab`.

```
bash terminal -m
```

| Label | Mount point |
| --- | --- |
| `internal` | `/media/internal` |
| `external` | `/media/&lt;user&gt;/external` |

- **By UUID.** Entries name each drive by UUID, and the previous entry for each drive is replaced.
- **Mount points.** Missing mount points are created.
- **Safe boot.** Every entry is `users` and `nofail`, so drives stay user unmountable and a missing drive never blocks the boot.
- **Windows filesystems.** exFAT, FAT and NTFS drives are owned by the user.
- **Checked.** The new file must pass `findmnt --verify` first, columns are aligned to the longest entry and the old file is kept as `/etc/fstab.backup`.

## Images

<!-- images | emerald | IMAGES // @IMAGES@ CONTAINER IMAGES FOR DEXTOP -->

Dextop container images are built with `utility-filesystem-build`: Debian, Ubuntu and Fedora, with Debian @DEFAULT@ as the default.

<!-- include images -->

- **Debian and Ubuntu.** Bootstrapped with debootstrap, both stages, so every package is installed and configured. Images of another architecture (the default is arm64) need `qemu-user-static` for the second stage.
- **Archived releases.** Archived Debian releases come from archive.debian.org with their retired release keys.
- **Verified.** Ubuntu is verified against the official Ubuntu keyring, fetched over https. Fedora is taken from the official Base-Generic container image, checked against its published checksum, and needs no codename.
- **Next to the script.** The finished `archive-<name>-<version>.tar.xz` is copied next to the script, so a build run from the repository lands in the repository, where Dextop downloads it.

`./utility-filesystem-build -s` lists every image to pick by number.

## Gutenberg

<!-- gutenberg | teal | GUTENBERG // THE WHOLE LIBRARY, ON YOUR DRIVE -->

`utility-gutenberg` mirrors the Project Gutenberg collection and processes it into a flat library. With `-r` the download runs as a resume service: it continues after a reboot and removes itself once done. Nothing carries over to later runs.

```
./utility-gutenberg -m -p -r -d <directory>
```

<!-- include gutenberg -->

## Uninstall

<!-- uninstall | cyan | UNINSTALL // EVERYTHING THE SETUP LINKED -->

After a confirmation, `bash terminal -n` removes what the terminal setup installed.

```
bash terminal -n
```

| Removed | Kept |
| --- | --- |
| The shell files and functions in `~/.local/bin` | Home directories |
| The dotfile links it made (`.bashrc`, `.bash_aliases`, `.gitconfig` ...) | Themes and the boot theme |
| The storage links in `/media` | Drive mounts |
| Passwordless sudo: its `/etc/sudoers.d` file and any lines earlier versions added to `/etc/sudoers` | Every package |
| Every link to `run` |  |

A default `.bashrc` is put back in place of the removed link.

## Commands

<!-- commands | sky | COMMANDS // EVERY UTILITY AND OPTION -->

The help of all @SCRIPTS@ Terminal scripts, read from the scripts themselves: @OPTIONS@ options with their values. The marked letter is the short option. Search them, or pick a group.

<!-- include commands -->

## Functions

<!-- functions | blue | FUNCTIONS // @FUNCTIONS@ SHELL FUNCTIONS -->

The shell setup installs every function of the repository, read from its files.

<!-- include functions -->

- **One file each.** Each function lives in its own `bash-function-<name>` file, loaded by `bash-functions` from `~/.local/bin`.
- **From anywhere.** Type a name in a terminal, or in KRunner through its link to `run`.
- **As root.** Functions load in a root shell too: open one with `sudo -i`.

## Uses

<!-- uses | indigo | USES // A SERVICE REPOSITORY FOR OTHER PROJECTS -->

Terminal is also a service repository: other projects download their images, packages and shell files from it.

<!-- include uses -->

- **One address.** Files are fetched from `get.trmnl.me`, which points to this repository, so every project always gets the latest version.
- **Unchanged sources.** The Termux packages are uploaded unchanged from the official Termux releases, and the images are built from official sources checked against their keys and checksums.
- **Built on Frobulator.** Every Terminal script is built on the Frobulator shell parser and scripting function library.

