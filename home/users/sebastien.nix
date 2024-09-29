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
  ];
  
  home.packages = with pkgs; [
    inputs.Neve.packages.${pkgs.system}.default

    unzip
    gnutar

    slack
  ];

  home.stateVersion = "24.11";
}