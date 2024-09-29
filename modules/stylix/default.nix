{ inputs, pkgs, ... }: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    image = ../../assets/wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
  };
}
