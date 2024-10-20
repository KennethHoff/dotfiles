{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = ["hyprland/workspaces"];
        modules-right = ["upower" "clock" "tray"];

        upower = {
          icon-size = 20;
          hide-if-empty = true;
          tooltip = true;
          tooltip-spacing = 20;
        };

        battery = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };

        clock = {
          interval = 1;
          # "format-alt" = "{:%A, %B %d, %Y (%R)}  ";
          format = "{:%H:%M:%S}  ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };
      }
    ];
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
         #upower,
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
}
