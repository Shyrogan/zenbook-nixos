{ pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      shell = "${pkgs.nushell}/bin/nu";
      window_padding_width = 4;
    };

    font = {
      name = lib.mkForce "JetBrainsMono Nerd Font Mono";
      size = lib.mkForce 10;
    };
  };

  home.packages = with pkgs; [
    nerdfonts
  ];
}
