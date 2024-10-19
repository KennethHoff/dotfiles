{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  
  home = {
    username = "kennethhoff";
    homeDirectory = "/home/kennethhoff";
  };

  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
    settings = [{
	    "layer" = "top";
	    "position" = "top";
	    modules-left = [
		    "custom/launcher"
			    "temperature"
			    "mpd"
			    "custom/cava-internal"
	    ];
	    modules-center = [
		    "clock"
	    ];
	    modules-right = [
		    "pulseaudio"
			    "backlight"
			    "memory"
			    "cpu"
			    "network"
			    "custom/powermenu"
			    "tray"
	    ];
	    "custom/launcher" = {
		    "format" = " ";
		    "on-click" = "pkill rofi || rofi2";
		    "on-click-middle" = "exec default_wall";
		    "on-click-right" = "exec wallpaper_random";
		    "tooltip" = false;
	    };
	    "custom/cava-internal" = {
		    "exec" = "sleep 1s && cava-internal";
		    "tooltip" = false;
	    };
	    "pulseaudio" = {
		    "scroll-step" = 1;
		    "format" = "{icon} {volume}%";
		    "format-muted" = "󰖁 Muted";
		    "format-icons" = {
			    "default" = [ "" "" "" ];
		    };
		    "on-click" = "pamixer -t";
		    "tooltip" = false;
	    };
	    "clock" = {
		    "interval" = 1;
		    "format" = "{:%I:%M %p  %A %b %d}";
		    "tooltip" = true;
		    "tooltip-format"= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
	    };
	    "memory" = {
		    "interval" = 1;
		    "format" = "󰻠 {percentage}%";
		    "states" = {
			    "warning" = 85;
		    };
	    };
	    "cpu" = {
		    "interval" = 1;
		    "format" = "󰍛 {usage}%";
	    };
	    "mpd" = {
		    "max-length" = 25;
		    "format" = "<span foreground='#bb9af7'></span> {title}";
		    "format-paused" = " {title}";
		    "format-stopped" = "<span foreground='#bb9af7'></span>";
		    "format-disconnected" = "";
		    "on-click" = "mpc --quiet toggle";
		    "on-click-right" = "mpc update; mpc ls | mpc add";
		    "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
		    "on-scroll-up" = "mpc --quiet prev";
		    "on-scroll-down" = "mpc --quiet next";
		    "smooth-scrolling-threshold" = 5;
		    "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
	    };
	    "network" = {
		    "format-disconnected" = "󰯡 Disconnected";
		    "format-ethernet" = "󰒢 Connected!";
		    "format-linked" = "󰖪 {essid} (No IP)";
		    "format-wifi" = "󰖩 {essid}";
		    "interval" = 1;
		    "tooltip" = false;
	    };
	    "custom/powermenu" = {
		    "format" = "";
		    "on-click" = "pkill rofi || ~/.config/rofi/powermenu/type-3/powermenu.sh";
		    "tooltip" = false;
	    };
	    "tray" = {
		    "icon-size" = 15;
		    "spacing" = 5;
	    };
    }];
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


  # Sets Dark Mode
dconf.settings = {
  "org/gnome/desktop/background" = {
    picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
  };
  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
};

# gtk = {
#   enable = true;
#   theme = {
#     name = "Adwaita-dark";
#     package = pkgs.gnome.gnome-themes-extra;
#   };
# };

# # Wayland, X, etc. support for session vars
# systemd.user.sessionVariables = config.home-manager.users.justinas.home.sessionVariables;
# };
#
# qt = {
# enable = true;
# platformTheme = "gnome";
# style = "adwaita-dark";
# };


  ## BOILER PLATE ##

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";
  # Do not change this unless you know what you're doing; It's not the NixOS version, but (as of 2024-17-10) I have no idea what it is.
  home.stateVersion = "24.05";
}
