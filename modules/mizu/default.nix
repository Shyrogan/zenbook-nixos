{ config, inputs, lib, ... }: with lib; {
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
      users.sebastien = import ./home/users/sebastien.nix;
      extraSpecialArgs = { inherit inputs; };
      sharedModules = [
        nixvim.homeManagerModules.nixvim
        walker.homeManagerModules.default
      ];
      backupFileExtension = "backup";
    };
  };
}
