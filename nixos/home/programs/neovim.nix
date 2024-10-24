{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ../../utils.nix
  ];
  home.packages = with pkgs; [
    neovim
    gcc # Needed for <some reason>. Quick googling says it's needed by `Treesitter`.
    ripgrep
    fd
    lua-language-server
    nil # Unofficial Nix Language Server
    nixfmt-rfc-style # Official Nix Code Formatter
    stylua
  ];

  # Symlink the `~/.config/nvim` to the `~/dotfiles/nvim/.config/nvim` directory
  # This essentially mirrors `GNU stow` in home-manager
  # This is an anti-pattern in Nix land, but I've gotta be pragmatic.. I still use non-Nix OSes after all..
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/nvim/.config/nvim/";
}
