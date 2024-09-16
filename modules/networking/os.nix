{ pkgs, ...}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true ;

  networking = {
    networkmanager.enable = true;
  };
  environment.systemPackages = with pkgs; [ overskride networkmanagerapplet ];
}
