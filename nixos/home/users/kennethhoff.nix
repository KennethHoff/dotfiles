{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../themes/catppuccin-mocha.nix
    ../programs/neovim.nix
    ../programs/tmux.nix
    ../programs/waybar.nix
    ../programs/hyprland.nix
    ../programs/obs-studio.nix
    ../programs/zsh.nix
    ../programs/fzf.nix
  ];
  home = {
    username = "kennethhoff";
    homeDirectory = "/home/kennethhoff";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  ## BOILER PLATE ##
  # Nicely reload system units when changing configs. (No idea what that means)
  systemd.user.startServices = "sd-switch";
  # Do not change this unless you know what you're doing; It's not the NixOS version, but (as of 2024-17-10) I have no idea what it is.
  home.stateVersion = "24.05";
}
