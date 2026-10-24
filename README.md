![terminal](https://raw.githubusercontent.com/nathaneltitane/terminal/main/terminal.svg)

[![Donate](https://img.shields.io/badge/Paypal-2f343f.svg?style=for-the-badge&logo=paypal&label=Donate)](https://www.paypal.com/donate?hosted_button_id=ZW3CDCANHJCWJ)<br>
Show your appreciation with a PayPal donation!

---

[![Star](https://img.shields.io/github/stars/nathaneltitane/terminal.svg?style=for-the-badge&logo=github&label=Star&color=2f343f)](https://github.com/nathaneltitane/terminal)<br>
Useful? Star the repository - it helps others find it.

---

[[ Terminal // Project Page ]](https://github.com/nathaneltitane/terminal)&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;[ Version // 2026-10-22 ]

---

### Welcome to [Terminal](https://terminal.me)

The Terminal repository is a  collection of shell scripts, templates, dotfiles and utilities to make your Linux-based system experience a breeze!

### Note:

All packages available in this repository for Termux are directly sourced and uploaded from the official Termux GitHub repository.

Regular updates are applied, and their names are modified exclusively for ease of reference in the scripts and projects that utilize them.

### Uses:

The following projects incorporate Terminal files in their usage:

[[ Dextop // Project Page ]](https://github.com/nathaneltitane/dextop)

### Superuser:

The shell setup links the superuser's dotfiles (`.bashrc`, `.bash_aliases`, `.bash_functions` ...) to the user's files in `~/.local/bin`. Each file loads frobulator and the function files from the folder behind its link, so a root shell gets every function, alias and script of the user:

```
sudo -i
```

Aliases also work after `sudo` (`sudo <alias>`). Functions need a root shell - `sudo` only runs programs.

Passwordless sudo is set in its own file, `/etc/sudoers.d/<user>`, rewritten on each run so it never repeats. Lines appended to `/etc/sudoers` by earlier versions are removed once the result passes the sudoers check.

### KRunner:

KRunner only runs executables on the `PATH`. The shell setup links every function name in `~/.local/bin` to `run`, so a function is typed in KRunner like any command:

```
weather
```

`run` takes the function from the name it was called by, or from its first argument (`run weather`). Launched without a terminal, it reopens itself in Konsole (or the default terminal), loads the user's functions, runs the function and waits for enter before closing. In a terminal it runs in place. Names that are already real commands (`ssh`, `who` ...) get no link. Uninstall removes every link to `run`.

### Mounts:

Drives labelled `internal` and `external` are mounted at boot through `/etc/fstab`, by UUID:

```
bash terminal -m
```

`internal` mounts at `/media/internal`, `external` at `/media/<user>/external`. Missing mount points are created and the previous entry for each drive is replaced. Every entry is `users` and `nofail`, so drives stay user unmountable and a missing drive never blocks the boot. Windows filesystems (exFAT, FAT, NTFS) are owned by the user. The new file must pass `findmnt --verify` first, columns are aligned to the longest entry and the old file is kept as `/etc/fstab.backup`.

### Images:

Dextop container images are built with `utility-filesystem-build` - Debian (10 to 13), Ubuntu (18.04 to 24.04) and Fedora (41 to 44). Debian 13 is the default:

```
./utility-filesystem-build -s
./utility-filesystem-build -i fedora 44
```

Debian and Ubuntu are bootstrapped with `debootstrap`, both stages, so every package is installed and configured - images of another architecture (the default is arm64) need `qemu-user-static` for the second stage. Archived Debian releases come from `archive.debian.org` with their retired release keys, and Ubuntu is verified against the official Ubuntu keyring, fetched over https. Fedora is taken from the official Base-Generic container image, checked against its published checksum. Fedora needs no codename. The finished `archive-<name>-<version>.tar.xz` is copied next to the script, so a build run from the repository lands in the repository, where Dextop downloads it.

### Gutenberg:

`utility-gutenberg -r` runs the download as a resume service: it continues after a reboot and removes itself once done. Nothing carries over to later runs.

```
./utility-gutenberg -m -p -r -d <directory>
```

### Uninstall:

To remove what the terminal setup installed, run:

```
bash terminal -n
```

After a confirmation, it removes the shell files and functions in `~/.local/bin`, the dotfile links it made (`.bashrc`, `.bash_aliases`, `.gitconfig` ...), the storage links in `/media` and passwordless sudo - its `/etc/sudoers.d` file and any lines earlier versions added to `/etc/sudoers`. A default `.bashrc` is put back in place of the removed link.

Kept: home directories, themes, the boot theme, drive mounts and every package.

### Repositories:

[Frobulator](https://github.com/nathaneltitane/frobulator) to streamline the scripts and make redundant code a thing of the past.

[GNU/Bash](https://github.com/gitGNU/gnu_bash) as the shell environment on top of which the scripts function.

### Reports:

[Submit bug report or feature request](https://github.com/nathaneltitane/terminal/issues)

### Projects:

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/dextop?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=DEXTOP)](https://github.com/nathaneltitane/dextop)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/frobulator?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=FROBULATOR)](https://github.com/nathaneltitane/frobulator)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/gutengrab?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=GutenGrab)](https://github.com/nathaneltitane/gutengrab)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/l2cu?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=L²CU)](https://github.com/nathaneltitane/l2cu)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/terminal?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=TERMINAL)](https://github.com/nathaneltitane/terminal)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/mechablocks?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=MECHA%20//%20BLOCKS)](https://github.com/nathaneltitane/mechablocks)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/pixtrm?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=PIXTRM)](https://github.com/nathaneltitane/pixtrm)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/nathaneltitane?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=NATHANEL%20%2b%20TITANE)](https://github.com/nathaneltitane/nathaneltitane)

[![GitHub Repo stars](https://img.shields.io/github/stars/nathaneltitane/pewpewprints?style=for-the-badge&logo=gnubash&logoColor=ffffff&label=PEW%21%20PEW%21%20PRINTS)](https://github.com/nathaneltitane/pewpewprints)

---

[[ Terminal // Project Page ]](https://github.com/nathaneltitane/terminal)&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;[ Version // 2026-10-22 ]

---

[![Donate](https://img.shields.io/badge/Paypal-2f343f.svg?style=for-the-badge&logo=paypal&label=Donate)](https://www.paypal.com/donate?hosted_button_id=ZW3CDCANHJCWJ)<br>
Show your appreciation with a PayPal donation!

---

[![Star](https://img.shields.io/github/stars/nathaneltitane/terminal.svg?style=for-the-badge&logo=github&label=Star&color=2f343f)](https://github.com/nathaneltitane/terminal)<br>
Useful? Star the repository - it helps others find it.
