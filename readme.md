# dotfiles

## NixOS Configuration

### How to add a new host

A host - or `hostname` - is, in essence, the computer itself; Which HDDs are in use, which architecture the CPU is using, and so on..

Let's say you want to create a new host, `nixos-media`, this can be added in these simple steps:

1. Use the NixOS Installer to install the various build tools needed on the new host.
2. Ensure it has `git` and `gh` (and `vim`) installed, by adding those tools to the `environment.systemPackages` section in the newly-created `/etc/nixos/configuration` file (`sudo nano /etc/nixos/configuration`)
3. Rebuild NixOS (`sudo nixos-rebuild switch`)
4. Clone this repository by calling `git clone https://github.com/kennethhoff/dotfiles`.
5. Assuming you git cloned into `~`, edit `~/dotfiles/nixos/flake.nix` by adding a new `nixosConfigurations` entry whose name uniquely identifies the host (At the time of writing we have two: `nixos-desktop` for the gaming desktop, and `nixos-dell` for the dell laptop)
   Realistically, all you need to do is copy-paste the `nixos-dell` section and rename all occurences to `nixos-media`.
6. Again, assuming you git cloned into `~`, copy the `~/dotfiles/nixos/hosts/nixos-dell/` directory and name the newly-created copy `~/dotfiles/nixos/hosts/nixos-media/`. Delete the `hardware-configuration.nix` file.
7. Finally, copy the `hardware-configuration.nix` file that the NixOS Installer created into the newly-created `~/dotfiles/nixos/hosts/nixos-media/` directory. This ensures that - among other things - storage devices and CPU architecture is correctly setup.
8. Log into GitHub by calling `gh auth login` and opening `https://github.com/login/device` on a different computer, inserting those 8 characters.
9. Ensure Git credentials are set up right, by calling `git config --global user.name "Kenneth Hoff"` and `git config --global user.email "kenneth.98@hotmail.com"`.
10. Push up your changes, by calling `git commit -m "Create new host"` and `git push`.
11. Rebuild your system, by calling `sudo nixos-rebuild switch --flake ~/dotfiles/nixos#nixos-media`. This will take a few minutes.
12. Reboot the computer by calling `reboot`. This is the final step.

