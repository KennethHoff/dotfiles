{
  pkgs,
  ...
}:
{
  imports = [
    ../themes/catppuccin-mocha.nix
    ../programs/neovim.nix
    ../programs/tmux.nix
    ../programs/waybar.nix
    ../programs/hyprland.nix
    ../programs/obs-studio.nix
    ../programs/zsh.nix
    ../programs/fzf.nix
    ../programs/yazi.nix
  ];
  home = {
    username = "kennethhoff";
    homeDirectory = "/home/kennethhoff";
    sessionVariables = {
      EDITOR = "nvim";
    };

    # Miscellaneous packages
    packages = with pkgs; [
      spotify
      lazygit
      firefox
      gh # GitHub CLI
      slack
      wl-clipboard
      vesktop # Custom Discord App with Improved Desktop (and `Vencord` pre-installed, which - among other things - adds support for plugins)
    ];
  };

  home.shellAliases = {
    lg = "lazygit";
  };

  ## BOILER PLATE ##
  # Nicely reload system units when changing configs. (No idea what that means)
  systemd.user.startServices = "sd-switch";
  # Do not change this unless you know what you're doing; It's not the NixOS version, but (as of 2024-17-10) I have no idea what it is.
  home.stateVersion = "24.05";
}
