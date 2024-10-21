{ pkgs, ... }: {
  home.packages = with pkgs; [ jetbrains.idea-ultimate android-studio openjdk11 ];
}
