{ config, ... }: {
  programs.waybar = let
    colors = config.lib.stylix.colors.withHashtag;
  in {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["hyprland/workspaces" "clock#date"];
        modules-center = ["hyprland/window"];
        modules-right = ["cpu" "memory" "temperature" "wireplumber" "battery"];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = " ";
            "2" = "󰈹";
            "3" = " ";
            "8" = " ";
            "9" = " ";
            "10" = " ";
            urgent = " ";
            focused = " ";
            default = " ";
          };
        };

        "hyprland/window" = {
          max-length = 64;
        };

        "clock" = {
           format = "  {:%a, %d. %b  %H:%M}";
           tooltip-format = "{:%e %B %Y}";
        };

        battery = {
          bat = "BAT0";
          interval = 10;
          states = {
            warning = 40;
            critical = 20;
          };
          format = "{capacity}% <span color=\"${colors.base0C}\">{icon}</span>";
          format-icons = [" " " " " " " " " "];
          format-charging = ["{capacity}% <span color=\"${colors.base0B}\">󱐌</span>"];
        };

        wireplumber = {
          interval = 4;
          scroll-step = 5;
          format-icons = ["" " " "󰕾 "];
          format = "{volume}% <span color=\"${colors.base0C}\">{icon}</span>";
          format-muted = "0% <span color=\"${colors.base0C}\"> </span>";
          on-click = "pavucontrol";
        };

        tray = {
          icon-size = 20;
          spacing = 6;
        };

        temperature = {
          critical-threshold = 80;
          format = "<span color=\"${colors.base0C}\"></span> {temperatureC}°C";
          format-critical = "<span color=\"${colors.base0A}\"></span> {temperatureC}°C";
          interval = 4;
        };

        cpu = {
          format = "<span color=\"${colors.base0C}\">󰍛</span>  {usage}%";
          interval = 4;
        };

        memory = {
          format = "<span color=\"${colors.base0C}\"></span>   {used}GiB";
          interval = 4;
        };
      };
    };
    style = ''
        /* Reset */
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        padding: 0;

        font-weight: 600;
        font-size: 6.5pt;
        color: ${colors.base07}
      }

      /* All 3 modules should have paddings */
      .modules-left, .modules-right, .modules-center {
        background: ${colors.base00};
        padding: 0 10px;
      }

      /* On the left and center, we round the right corners */
      .modules-left, .modules-center {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
      }

      /* On the right and center, we round the left corners */
      .modules-right, .modules-center {
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
      }

      #waybar {
        background: transparent;
      }

      #workspaces {
        font-size: 9pt;
        margin-right: 8px;
      }

      #workspaces button {
        padding: 4px;
      }

      #workspaces button.active {
        margin-top: 2px;
        border-bottom: 2px solid ${colors.base0C};
      }

      #battery, #wireplumber, #temperature, #memory {
        margin-left: 8px;
      }
      '';
  };
  stylix.targets.waybar.enable = false;
}
