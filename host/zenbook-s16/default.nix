{ pkgs, inputs, ... }:
{
  networking.hostName = "mizu";

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/os
    ../../modules/networking
    ../../modules/audio
    ../../modules/virtualisation
    ../../modules/gaming
    ../../modules/mizu
    ../../modules/desktop/hyprland/os.nix
  ];

  users.users.root.hashedPassword = "!";
  mizu.sebastien.enable = true;

  # Required for Hyprland apps to work properly.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}

