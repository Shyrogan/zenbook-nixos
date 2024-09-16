{ pkgs, ... }: {
  home.packages = with pkgs; [ modrinth-app-unwrapped temurin-jre-bin-17 ];
}
