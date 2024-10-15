{ pkgs, config, ...}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;
      secretsFile = config.age.secrets.wifis.path;
      networks = {
        eduroam = {
          auth = ''
          identity="sebastien.vial@etu.umontpellier.fr"
          password=ext:EDUROAM_PASSWORD
          key_mgmt=WPA-EAP
          pairwise=CCMP
          group=CCMP TKIP
          eap=PEAP
          ca_cert="${../../assets/networking/eduroam.pem}"
          altsubject_match="DNS:wifi.umontpellier.fr"
          phase2="auth=MSCHAPV2"
          '';
        };
        SFR-a470_5GHz = {
          auth = ''
          psk=ext:APS_PASSWORD
          '';
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [ overskride wpa_supplicant_gui ];
}
