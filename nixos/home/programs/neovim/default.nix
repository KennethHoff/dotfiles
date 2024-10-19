{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
  ];

  programs.neovim = {
    enable = true;
  };

  home.file."./.config/nvim/" = {
    source = ./configuration;
    recursive = true;
  };
}
