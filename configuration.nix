{ pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/os
    ./modules/networking/os.nix
    ./modules/audio/os.nix
    ./modules/desktop/hyprland/os.nix
    ./modules/steam/os.nix
  ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  
  users.users = {
    sebastien = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" ]; # Enable ‘sudo’ for the user
      packages = with pkgs; [
        nushell
      ];
      shell = pkgs.nushell;
    };
    root.hashedPassword = "!";
  };

  # Required for Hyprland apps to work properly.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}

