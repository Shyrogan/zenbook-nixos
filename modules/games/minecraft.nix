{ pkgs, ... }: {
  home.packages = with pkgs; [ modrinth-app temurin-jre-bin-17 ];
}
