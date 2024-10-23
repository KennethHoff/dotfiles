{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Screenshot Utility made by the Hyprland team.
    grimblast
  ];

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

  # FIXME: Figure out why `hyprlock` just freezes the screen after coming back from `hypridle`(?)
  programs.hyprlock = {
    enable = false;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      ## I don't have a password, so I don't need an input field..
      # input-field = [
      #   {
      #     size = "200, 50";
      #     position = "0, -80";
      #     monitor = "";
      #     dots_center = true;
      #     fade_on_empty = false;
      #     font_color = "rgb(202, 211, 245)";
      #     inner_color = "rgb(91, 96, 120)";
      #     outer_color = "rgb(24, 25, 38)";
      #     outline_thickness = 5;
      #     placeholder_text = "'<span foreground=\"##cad3f5\">Password...</span>'";
      #     shadow_passes = 2;
      #   }
      # ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        # FIXME: Figure out why `hyprlock` just freezes the screen after coming back from `hypridle`(?)
        # {
        #   timeout = 900;
        #   on-timeout = "hyprlock";
        # }
        {
          timeout = 1200;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      input = {
        repeat_delay = "200";
        repeat_rate = "30";
      };
      general = {
        no_focus_fallback = true;
        gaps_in = 2;
        gaps_out = 5;
        border_size = 5;
      };
      monitor = [
        "DP-1,     preferred, auto      , 1"
        "HDMI-A-1, preferred, auto-left , 2"
        "HDMI-A-2, preferred, auto-right, 2"
      ];
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
      exec-once = [
        "[workspace 3 silent] firefox"
        "[workspace 5 silent] spotify"
        "[workspace 1 silent] kitty"
      ];
      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod SHIFT, P, exit"
        "$mainMod SHIFT, C, killactive"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, M, fullscreen, 0"
        "$mainMod, S, exec, grimblast --freeze copysave area ~/Pictures/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"
        "$mainMod SHIFT, L, exec, hyprlock"

        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, L, movewindow, r"

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
}
