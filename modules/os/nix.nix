{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    extraOptions = ''
        trusted-users = root sebastien
    '';
  };
  environment.systemPackages = with pkgs; [ nh ];
}
