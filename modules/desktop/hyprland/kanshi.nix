{ pkgs, ...  }: {
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "3screens";
        profile.outputs = [
          { criteria = "eDP-1"; position = "-1440,0"; scale = 2.00; status = "enable"; }
          { criteria = "Iiyama North America PL2488H 0"; position = "1920,-540"; transform = "90"; status = "enable"; }
          { criteria = "LG Electronics LG ULTRAGEAR 101NTKFEN429"; position = "0,0"; scale = 1.33333333; status = "enable"; }
        ];
      }
      {
        profile.name = "2screens";
        profile.outputs = [
          { criteria = "eDP-1"; position = "-1920,0"; scale = 2.00; status = "disable"; }
          { criteria = "Iiyama North America PL2488H 0"; position = "1920,-540"; transform = "90"; status = "enable"; }
          { criteria = "LG Electronics LG ULTRAGEAR 101NTKFEN429"; position = "0,0"; scale = 1.33333333; status = "enable"; }
        ];
      }
      {
        profile.name = "undocked";
        profile.outputs = [
          { criteria = "eDP-1"; scale = 2.00; status = "enable"; }
        ];
      }
    ];
  };
  home.packages = with pkgs; [
    kanshi
  ];
}
