{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../programs/neovim.nix
    ../programs/tmux.nix
    ../programs/waybar.nix
    ../programs/hyprland.nix
  ];

  home.username = "kennethhoff";
  home.homeDirectory = "/home/kennethhoff";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Enables the Catppuccin theme globally.
  catppuccin.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git"];
    };
    initExtra = ''
      PROMPT="%F{cyan}%d%f %F{yellow}%#%f "
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # xdg = {
  #   "XDG_OPEN" = "your-file-manager-command";
  # };

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.gnome.gnome-themes-extra;
  #   };
  # };

  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  # gtk = {
  #   enable = true;
  #
  #   theme = {
  #     package = pkgs.flat-remix-gtk;
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #   };
  #
  #   iconTheme = {
  #     package = pkgs.gnome.adwaita-icon-theme;
  #     name = "Adwaita-dark";
  #   };
  #
  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };

  # systemd.user.sessionVariables = config.home-manager.users.justinas.home.sessionVariables;
  # };

  ## BOILER PLATE ##

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";
  # Do not change this unless you know what you're doing; It's not the NixOS version, but (as of 2024-17-10) I have no idea what it is.
  home.stateVersion = "24.05";
}
