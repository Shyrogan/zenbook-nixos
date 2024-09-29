{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "docked";
        profile.outputs = [
          { criteria = "eDP-1"; status = "disable"; }
          { criteria = "DP-1"; transform = "90"; }
          { criteria = "HDMI-A-1"; scale = 1.33; }
        ];
      }
      {
        profile.name = "undocked";
        profile.outputs = [
          { criteria = "eDP-1"; scale = 2.00; }
        ];
      }
    ];
  };
}
