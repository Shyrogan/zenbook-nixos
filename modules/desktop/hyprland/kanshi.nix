{ pkgs, ...  }: {
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "docked";
        profile.outputs = [
          { criteria = "eDP-1"; status = "disable"; }
          { criteria = "Iiyama North America PL2488H 1134243101441"; transform = "90"; status = "enable"; position = "1920x-540"; }
          { criteria = "LG Electronics LG ULTRAGEAR 101NTKFEN429"; scale = 1.33333333; status = "enable"; }
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
