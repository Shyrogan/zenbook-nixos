{ config, inputs, lib, pkgs, ... }: with lib; {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  options.mizu.sebastien = {
    enable = mkEnableOption "Sebastien's user";
  };

  config = mkIf config.mizu.sebastien.enable {
    users.users.sebastien = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "docker" "dialout" ];
      packages = with pkgs; [
        nushell
      ];
      shell = pkgs.nushell;
    };
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.sebastien = import ../../home/users/sebastien.nix;
      extraSpecialArgs = { inherit inputs; };
      sharedModules = [
        inputs.nixvim.homeManagerModules.nixvim
        inputs.walker.homeManagerModules.default
      ];
      backupFileExtension = "backup";
    };
  };
}
