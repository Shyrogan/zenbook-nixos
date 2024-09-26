{ pkgs, ...}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking = {
    hostName = "sebastien-laptop";
    # networkmanager.enable = true;
    wireless = {
      enable = true;
      userControlled.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [ overskride wpa_supplicant_gui ];
}
