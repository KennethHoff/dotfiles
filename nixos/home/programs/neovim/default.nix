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

  # Copy the top-level neovim config into `..config/nvim`
  home.file."./.config/nvim/" = {
    source = ../../../../nvim/.config/nvim;
    recursive = true;
  };
}
