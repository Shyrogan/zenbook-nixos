{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [stdenv.mkDerivation {
    name = "ankama-launcher";
    src = fetchurl {
      src = "https://launcher.cdn.ankama.com/installers/production/Ankama%20Launcher-Setup-x86_64.AppImage";
      sha256 = "00mag1kjvqcxhs50fwvjyw5wvrkn8lagbr1lzkqg8rgac1qzb6p3";
    };
    installPhase = ''
      mkdir -p $out/bin
      cp Ankama\ Launcher-Setup-x86_64.AppImage $out/bin/ankama-launcher.AppImage
    '';
  }];
}
