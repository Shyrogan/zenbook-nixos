{ pkgs, config, ...}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  networking = {
    hostName = "sebastien-laptop";
    # networkmanager.enable = true;
    wireless = {
      enable = true;
      userControlled.enable = true;
      environmentFile = config.age.secrets.wifis.path;
      networks = {
        eduroam = {
          auth = ''
          identity="@EDUROAM_EMAIL@"
          password="@EDUROAM_PASSWORD@"
          key_mgmt=WPA-EAP
          pairwise=CCMP
          group=CCMP TKIP
          eap=PEAP
          ca_cert="${../networking/eduroam.pem}"
          altsubject_match="DNS:wifi.umontpellier.fr"
          phase2="auth=MSCHAPV2"
          '';
        };
        SFR-a470_5GHz = {
          auth = ''
          psk="@APS_PASSWORD@"
          '';
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [ overskride wpa_supplicant_gui ];
}
