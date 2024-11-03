{ inputs, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      wayland
      wl-clipboard
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  programs = {
    hyprland = {
        enable = true;
        xwayland.enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.default;
        portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal= true;
    config = {
      # common.default = ["gtk"];
      hyprland.default = ["hyprland"];
    };

    extraPortals = [
      # pkgs.xdg-desktop-portal-gtk
    ];
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
          variant = "";
          layout = "fr";
          options = "grp:win_space_toggle";
      };
    };
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${inputs.hyprland.packages.${pkgs.system}.default}/bin/Hyprland";
          user = "sebastien";
        };
        default_session = initial_session;
      };
    };
  };
}
