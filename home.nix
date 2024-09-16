{ pkgs, ... }: {
  imports = [
    ./modules/desktop/hyprland/sebastien.nix
    ./modules/networking/sebastien.nix
    ./modules/neovim/sebastien.nix
    ./modules/nushell/sebastien.nix
    ./modules/apps/kitty.nix
    ./modules/apps/discord.nix
    ./modules/apps/zathura.nix
    ./modules/apps/fastfetch.nix
    ./modules/apps/firefox.nix
    ./modules/apps/git.nix
  ];
  
  home.packages = with pkgs; [ unzip ];

  home.stateVersion = "24.11";
}
