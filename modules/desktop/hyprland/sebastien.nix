{ pkgs, ... }: 
{
  imports = [
    ./waybar.nix
    ./walker.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "monitor" = "eDP-1,preferred,auto,1.8";

      bind = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"

      	", XF86MonBrightnessDown, exec, brightnessctl s 10%-" 
      	", XF86MonBrightnessUp, exec, brightnessctl s 10%+" 

        "$mod, Return, exec, kitty"
        "$mod, n, exec, firefox"
        "$mod, Space, exec, walker"

        "$mod, c, killactive"

        "$mod, f, fullscreen"

        # Workspaces
        "$mod, ampersand, workspace, 1"
        "$mod, eacute, workspace, 2"
        "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, egrave, workspace, 6"
        "$mod, minus, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccedilla, workspace, 9"
        "$mod, agrave, workspace, 10"

        # Move to workspace
        "SHIFT $mod, ampersand, movetoworkspace, 1"
        "SHIFT $mod, eacute, movetoworkspace, 2"
        "SHIFT $mod, quotedbl, movetoworkspace, 3"
        "SHIFT $mod, apostrophe, movetoworkspace, 4"
        "SHIFT $mod, parenleft, movetoworkspace, 5"
        "SHIFT $mod, egrave, movetoworkspace, 6"
        "SHIFT $mod, minus, movetoworkspace, 7"
        "SHIFT $mod, underscore, movetoworkspace, 8"
        "SHIFT $mod, ccedilla, movetoworkspace, 9"
        "SHIFT $mod, agrave, movetoworkspace, 10"
        
        # Move between windows
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "SHIFT $mod, h, movewindow, l"
        "SHIFT $mod, j, movewindow, d"
        "SHIFT $mod, k, movewindow, u"
        "SHIFT $mod, l, movewindow, r"
      ];


      input = {
        kb_layout = "fr";
        touchpad = {
          scroll_factor = 0.3;
        };
        # TODO: improve mouse speed
        # force_no_accel = 1;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.15;
      };

      general = {
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 4;
      };
    };
    extraConfig = ''
    exec-once = waybar
    '';
  };


  services.hyprpaper = {
    enable = true;
  };

  services.dunst = {
    enable = true;
  };


  home.packages = with pkgs; [ hyprpaper brightnessctl ];
}
