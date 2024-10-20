{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrains Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
  home.packages = with pkgs; [
    grimblast
  ];
  programs.rofi.enable = true;
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
        "$mainMod, P, exit"
        "$mainMod, C, killactive"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, M, fullscreen, 0"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
        "$mainMod, S, exec, grimblast --freeze copysave area ~/Pictures/Screenshots/$(date '+%Y%m%d-%H:%M:%S').png"
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
