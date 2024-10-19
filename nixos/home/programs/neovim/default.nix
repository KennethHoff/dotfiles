{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  home.file."./.config/nvim/" = {
    source = ./configuration;
    recursive = true;
  };
}
