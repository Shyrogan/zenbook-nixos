{ pkgs, ... }:
{
  home.packages = with pkgs; [ iwd iwgtk ];
}
