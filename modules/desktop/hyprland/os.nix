{ pkgs, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
