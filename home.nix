{ pkgs, inputs, ... }: {
  imports = [
    ./modules/desktop/hyprland/sebastien.nix
    ./modules/networking/sebastien.nix
    ./modules/nushell/sebastien.nix
    ./modules/apps/kitty.nix
    ./modules/apps/discord.nix
    ./modules/apps/zathura.nix
    ./modules/apps/fastfetch.nix
    ./modules/apps/firefox.nix
    ./modules/apps/git.nix
    ./modules/apps/spotify.nix

    ./modules/games/minecraft.nix
  ];
  
  home.packages = with pkgs; [
    inputs.Neve.packages.${pkgs.system}.default

    unzip
    gnutar

    slack
  ];

  home.stateVersion = "24.11";
}
