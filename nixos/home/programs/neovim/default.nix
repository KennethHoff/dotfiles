{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ../../../utils.nix
  ];
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

  # Symlink the `~/.config/nvim` to the `~/dotfiles/nvim/.config/nvim` directory
	# This essentially mirrors `GNU stow` in home-manager
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/nvim/.config/nvim/";
}
