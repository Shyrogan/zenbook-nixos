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
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.starship = {
    enable = true;
  };
}
  
