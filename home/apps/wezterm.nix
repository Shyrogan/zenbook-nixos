{ pkgs, inputs, ... }: {
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      return {
        font = wezterm.font {
          family = "JetBrainsMono Nerd Font Mono",
          weight = "DemiBold",
        },
        font_size=10.0,
        colors = {
            foreground = "#ffffff",
            background = "#16181a",

            cursor_bg = "#ffffff",
            cursor_fg = "#16181a",
            cursor_border = "#ffffff",

            selection_fg = "#ffffff",
            selection_bg = "#3c4048",

            scrollbar_thumb = "#16181a",
            split = "#16181a",

            ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
            brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
            indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
        },
        window_background_opacity = 0.75,
        enable_tab_bar = false,
        window_close_confirmation = 'NeverPrompt'
      }
    '';
  };
}
