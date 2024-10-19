{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
    nil # Nix Language Server
    alejandra # Nix Code Formatter
		stylua
  ];

  programs.neovim = {
    enable = true;
  };

  home.file."./.config/nvim/" = {
    source = ./configuration;
    recursive = true;
  };
}
