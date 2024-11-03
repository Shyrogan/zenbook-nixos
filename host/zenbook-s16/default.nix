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

  mizu = {
    root = false;
    sebastien.enable = true;
  };

  services.upower.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}

