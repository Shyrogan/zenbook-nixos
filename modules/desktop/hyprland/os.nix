{ pkgs, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
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


  # Nautilus
  environment.systemPackages = with pkgs; [ nautilus wl-clipboard ];
  services.gvfs.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
