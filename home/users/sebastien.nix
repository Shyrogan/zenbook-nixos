{ pkgs, inputs, lib, ... }: {
  imports = [
    ../../modules/desktop/hyprland/sebastien.nix
    ../apps/nushell.nix
    ../apps/kitty.nix
    ../apps/discord.nix
    ../apps/zathura.nix
    ../apps/fastfetch.nix
    ../apps/firefox.nix
    ../apps/git.nix
    ../apps/spotify.nix
    ../apps/vscode.nix
    ../apps/intellij.nix
    ../apps/gitkraken.nix
    ../apps/minecraft.nix

    ../apps/wezterm.nix
    
    ../apps/dev/python3.nix
    ../apps/dev/javascript.nix
  ];
  
  home.packages = with pkgs; [
    statix

    unzip
    gnutar

    slack
    thunderbird
    haruna
    obs-studio

    devenv

    uxplay
    staruml
  ];

  programs.nixvim = {
    enable = true;
    imports = [ inputs.Neve.nixvimModule ];
    colorschemes = {
      catppuccin.enable = lib.mkForce false;
      base16 = {
        enable = lib.mkForce false;
        colorscheme = lib.mkForce "default-dark";
      };
      cyberdream = {
        enable = lib.mkForce true;
        settings.transparent = true;
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      "application/pdf" = "zathura.desktop";
    };
  };

  home.stateVersion = "24.11";
}
