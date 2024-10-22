# dotfiles

## NixOS Configuration

### How to add a new host

A host - or `hostname` - is, in essence, the computer itself; Which HDDs are in use, which architecture the CPU is using, and so on..

Let's say you want to create a new host, `nixos-media`, this can be added in these simple steps:

1. Use the NixOS Installer to install the various build tools needed on the new host.
2. Temporarily install `git`, and `gh` (Optionally `neovim`, and `lazygit`) by calling `nix-shell -p git gh neovim lazygit`. These apps are scoped to the current session and will be deleted when you disconnect (`ctrl-d`) or reboot the machine.
3. Clone this repository by calling `git clone https://github.com/kennethhoff/dotfiles`.
4. Assuming you git cloned into `~`, edit `~/dotfiles/nixos/flake.nix` by adding a new `nixosConfigurations` entry whose name uniquely identifies the host (At the time of writing we have two: `nixos-desktop` for the gaming desktop, and `nixos-dell` for the dell laptop)
   Realistically, all you need to do is copy-paste the `nixos-dell` section and rename all occurences to `nixos-media`.
5. Again, assuming you git cloned into `~`, copy the `~/dotfiles/nixos/hosts/nixos-dell/` directory and name the newly-created copy `~/dotfiles/nixos/hosts/nixos-media/`. Delete the `hardware-configuration.nix` file.
6. Finally, copy the `hardware-configuration.nix` file that the NixOS Installer created into the newly-created `~/dotfiles/nixos/hosts/nixos-media/` directory. This ensures that - among other things - storage devices and CPU architecture is correctly setup.
7. Log into GitHub by calling `gh auth login` and opening `https://github.com/login/device` on a different computer, inserting those 8 characters.
8. Ensure Git credentials are set up right, by calling `git config --global user.name "Kenneth Hoff"` and `git config --global user.email "kenneth.98@hotmail.com"`.
9. Push up your changes, by calling `git commit -m "Create new host"` and `git push`.
10. Rebuild your system, by calling `sudo nixos-rebuild switch --flake ~/dotfiles/nixos#nixos-media`. This will take a few minutes.
11. Reboot the computer by calling `reboot`. This is the final step.

### Future Plans

- [x] Remote Desktop (Connect to host remotely)
  - [x] With SSH Tunneling (for security).

- [ ] Safely store secrets, like host password.
    - This is de-facto mandatory for allowing SSH tunneling on the internet; Currently it's only accessible on the local network.

- [ ] [Impermanence](https://nixos.wiki/wiki/Impermanence) (Wipe root directory every time you reboot)

- [ ] Wake-On-Lan (Start host over the internet)

- [ ] Support for norwegian `Æ`, `Ø`, and `Å` (and their lowercase variants)

- [ ] Split home-manager directory into smaller chunks to allow for host-specific applications.

- [ ] Improved Audio management
   - [ ] Audio Router (Route specific apps to specific output channels; {Spotify -> User}, {Discord -> User}, {Game -> Recording & User}
   - [ ] Audio Mixer (Raise and lower volume of specific apps for specific outputs)

- [ ] Install [nix-darwin](https://github.com/LnL7/nix-darwin) on my Mac.
   - While it doesn't support _everything_ that NixOS in its entirety does, it seems to support many. Also, you can install `homebrew` apps through `nix-darwin` so there's seemingly no reason not to just migrate.
   - I imagine it's recommended to factory reset the Mac before doing this, but I know it's technically not required.

- [ ] Simplify bootstrapping of new hosts.
   - While this is far from complicated/time-consuming, there are obvious improvements that can be made here. Look into if it's possible to create a one-liner that does it all (`curl *** | sh`)

