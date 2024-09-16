{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.pam.services.hyprlock = {};
  services.greetd = {
    enable = true;
    settings = let
      session = {
        command = "${pkgs.hyprland}/bin/hyprland";
        user = "sebastien";
      };
    in {
      default_session = session;
      initial_session = session;
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
