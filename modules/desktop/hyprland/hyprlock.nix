{ config, ... }:
{
  programs.hyprlock = let
    colors = config.lib.stylix.colors.withHashtag;
  in {
    enable = true;
    settings = {
      general = {
        grace = 5;
        no_fade_in = false;
        disable_loading_bar = false;
      };

      background = {
        path = "${config.stylix.image}";
        blur_passes = 2;
        blur_size = 7;
      };
     label = [
      {
        # Day-Month-Date
        monitor = "";
        text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
        color = "${colors.base07}";
        font_size = 28;
        font_family = "SFProDisplay Nerd Font Bold";
        position = "0, 490";
        halign = "center";
        valign = "center";
      }
      # Time
      {
        monitor = "";
        text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
        color = "${colors.base07}";
        font_size = 160;
        font_family = "steelfish outline regular";
        position = "0, 370";
        halign = "center";
        valign = "center";
      }
      # USER
      {
        monitor = "";
        text = "Sébastien VIAL (sebastien@shyrogan.fr)";
        color = "${colors.base0C}";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        font_size = 18;
        font_family = "SFProDisplay Nerd Font Bold";
        position = "0, -180";
        halign = "center";
        valign = "center";
      }
    ];
      input-field = [{
        monitor = "";
        size = "300, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(255, 255, 255, 0)";
        inner_color = "rgba(255, 255, 255, 0.1)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "SFProDisplay Nerd Font Bold";
        placeholder_text =
          ''<i><span foreground="##ffffff99">  Mot de passe</span></i>'';
        hide_input = false;
        position = "0, -250";
        halign = "center";
        valign = "center";
      }];
    };
  };
}
