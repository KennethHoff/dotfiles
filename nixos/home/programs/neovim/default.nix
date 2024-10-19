{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
    '';
  };

  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };
}
