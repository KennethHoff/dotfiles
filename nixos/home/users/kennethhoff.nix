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
      slack
      vesktop # Custom Discord App with Improved Desktop (and `Vencord` pre-installed, which - among other things - adds support for plugins)
    ];
  };

  home.shellAliases = {
    lg = "lazygit";
  };

  systemd.user.services.wayvnc = {
    Unit.Description = "Allows remote connections to this host";
    Install.WantedBy = [ "default.target" ];
    Service = {
      ExecStart = "${pkgs.wayvnc}/bin/wayvnc -o DP-1 0.0.0.0 5900";
      Restart = "always";
      RestartSec = 10;
    };
  };

  ## BOILER PLATE ##
  # Nicely reload system units when changing configs. (No idea what that means)
  systemd.user.startServices = "sd-switch";
  # Do not change this unless you know what you're doing; It's not the NixOS version, but (as of 2024-17-10) I have no idea what it is.
  home.stateVersion = "24.05";
}
