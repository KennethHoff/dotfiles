{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

  home = {
    username = "kennethhoff";
    homeDirectory = "/home/kennethhoff";
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";

  # Do not change this unless you know what you're doing; It's not the NixOS version, but (as of 2024-17-10) I have no idea what it is.
  home.stateVersion = "24.05";
}
