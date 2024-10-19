{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ../programs/neovim
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

  # TODO: Move this to a dedicated flake
  programs.waybar = {
    enable = true;
    settings = [{
      "layer" = "top";
      "position" = "top";
      "modules-center" = ["hyprland/workspaces"];
      "modules-right" = ["pulseaudio" "backlight" "battery" "clock" "tray"];
    }];
    style = ''
      * {
        font-family: FantasqueSansMono Nerd Font;
        font-size: 17px;
        min-height: 0;
      }
      
      #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
      }
      
      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
      }
      
      #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
      }
      
      #workspaces button.active {
        color: @sky;
        border-radius: 1rem;
      }
      
      #workspaces button:hover {
        color: @sapphire;
        border-radius: 1rem;
      }
      
      #custom-music,
      #tray,
      #backlight,
      #clock,
      #battery,
      #pulseaudio,
      #custom-lock,
      #custom-power {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }
      
      #clock {
        color: @blue;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }
      
      #battery {
        color: @green;
      }
      
      #battery.charging {
        color: @green;
      }
      
      #battery.warning:not(.charging) {
        color: @red;
      }
      
      #backlight {
        color: @yellow;
      }
      
      #backlight, #battery {
          border-radius: 0;
      }
      
      #pulseaudio {
        color: @maroon;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }
      
      #custom-music {
        color: @mauve;
        border-radius: 1rem;
      }
      
      #custom-lock {
          border-radius: 1rem 0px 0px 1rem;
          color: @lavender;
      }
      
      #custom-power {
          margin-right: 1rem;
          border-radius: 0px 1rem 1rem 0px;
          color: @red;
      }
      
      #tray {
        margin-right: 1rem;
        border-radius: 1rem;
      }
    '';
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    initExtra = '' 
      PROMPT="%F{cyan}%d%f %F{yellow}%#%f "
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrains Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
  programs.rofi.enable = true;
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      general = {
        no_focus_fallback = true;
        gaps_in = 2;
        gaps_out = 5;
        border_size = 5;
      };
      animations = {
        enabled = true;
        animation = [
          "windows, 1, 7, default"
          "windowsOut, 1, 7, default"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 3, default"
        ];
      };
      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod, P, exit"
        "$mainMod, C, killactive"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, M, fullscreen, 1"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
	"$mainMod, S, exec, grim -g \"$(slurp -o -r -c '##ff0000ff')\" -t ppm - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"

        
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];
    };
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
