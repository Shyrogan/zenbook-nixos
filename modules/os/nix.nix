{
  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
