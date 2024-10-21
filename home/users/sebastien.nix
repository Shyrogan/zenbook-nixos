{ pkgs, inputs, ... }: {
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
    
    ../apps/dev/python3.nix
  ];
  
  home.packages = with pkgs; [
    inputs.Neve.packages.${pkgs.system}.default
    statix

    unzip
    gnutar

    slack
    thunderbird
    haruna
    obs-studio

    arduino-cli
    arduino-ide

    cargo
    rustc
    glibc

    nodePackages_latest.wrangler
  ];

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
