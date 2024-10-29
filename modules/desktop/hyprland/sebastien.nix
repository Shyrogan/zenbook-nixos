{ pkgs, inputs, ... }: 
{
  imports = [
    ./waybar.nix
    ./walker.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./kanshi.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings = {
      "$mod" = "SUPER";

      bind = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"

        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-" 
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+" 

        "$mod, Return, exec, wezterm"
        "$mod, n, exec, firefox"
        "$mod, Space, exec, walker --modules applications"

        "$mod, d, killactive"
        "$mod, f, fullscreen"
        "$mod, v, togglefloating"

        # Workspaces
        "$mod, ampersand, workspace, 1" "$mod, eacute, workspace, 2" "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, egrave, workspace, 6"
        "$mod, minus, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccedilla, workspace, 9"
        "$mod, agrave, workspace, 10"
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
        "CTRL $mod, h, resizeactive, -5% 0%"
        "CTRL $mod, j, resizeactive, 0% -5%"
        "CTRL $mod, k, resizeactive, 0% 5%"
        "CTRL $mod, l, resizeactive, 5% 0%"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];


      input = {
        kb_layout = "fr";
        touchpad = {
          scroll_factor = 0.3;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.15;
      };

      general = {
        gaps_out = 5;
        gaps_in = 3;
        border_size = 1;
      };

      decoration = {
        rounding = 4;
        blur = {
          passes = 4;
        };
      };
    };
    extraConfig = ''
    exec-once = kanshi
    exec-once = hyprlock --immediate
    exec-once = waybar
    exec-once=walker --gapplication-service

    exec-once = [workspace 8 silent] slack
    exec-once = [workspace 9 silent] vesktop
    exec-once = [workspace 10 silent] spotify
    
    windowrulev2 = workspace 9,initialClass:^(vesktop)$
    
    animation = workspaces, 1, 2, default
    animation = windows, 1, 2, default, slide
    animation = fade, 0
    
    layerrule = blur,waybar
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
