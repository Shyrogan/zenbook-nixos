{
  programs.nushell = {
    enable = true;
    configFile = {
      text = ''
      $env.config = {
        show_banner: false,
      };
      '';
    };
    shellAliases = {
      ll = "ls -l";
      nix-shell = "nix-shell --run nu";
    };
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.starship = {
    enable = true;
  };
}
  
