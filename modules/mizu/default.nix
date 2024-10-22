{ config, inputs, lib, pkgs, ... }: with lib; {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  options.mizu = {
    root = mkEnableOption "Root user";
    sebastien = {
      enable = mkEnableOption "Sebastien's user";
    };
  };

  config = {
    users.users = {
      sebastien = mkIf config.mizu.sebastien.enable {
        isNormalUser = true;
        extraGroups = [ "wheel" "audio" "docker" "dialout" ];
        packages = with pkgs; [
          nushell
        ];
        shell = pkgs.nushell;
      };
      users.users.root = mkIf config.mizu.root {
        hashedPassword = "!";
      };
    };
    home-manager = mkIf config.mizu.sebastien.enable {
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
