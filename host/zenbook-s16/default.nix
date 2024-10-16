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
    ../../modules/desktop/hyprland/os.nix
  ];

  users.users = {
    sebastien = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "docker" "dialout" ];
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

  environment.systemPackages = with pkgs; [
    python3
    python312Packages.pyserial
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}

