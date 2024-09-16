{ pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/networking/os.nix
    ./modules/audio/os.nix
    ./modules/desktop/hyprland/os.nix
  ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  # This configuration is specifically designed for the latest Zenbook S16.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_6_10;
    kernelPatches = [
      # This patches causes some error when running...
      #{
      #  name = "amd-pstate: Add missing documentation for `amd_pstate_prefcore_ranking`";
      #  patch = ./patches/amd_pstate.patch;
      #}
      {
        name = "Bluetooth: btusb: Add USB HW ID for ASUS Zenbook S 16";
        patch = ./patches/bluetooth.patch;
      }
      {
        name = "asus-wmi: Disable OOBE experience on Zenbook S 16";
        patch = ./patches/keyboard.patch;
      }
      {
        name = "accel/amdxdna: Add a new driver for AMD AI Engine";
        patch = ./patches/npu.patch;
      }
      {
        name = "ASoC: amd: acp: add ZSC control register programming sequence";
        patch = ./patches/zsc_control.patch;
      }
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .

  system.stateVersion = "24.11"; # Did you read the comment?
}

