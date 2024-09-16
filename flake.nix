{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, stylix, nixvim, ... }@inputs: {
    nixosConfigurations.sebastienix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
      	./configuration.nix
	home-manager.nixosModules.home-manager
	
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.sebastien = import ./home.nix;
	  home-manager.extraSpecialArgs = { inherit inputs; };
	  home-manager.sharedModules = [
	    nixvim.homeManagerModules.nixvim
	  ];
	}
	stylix.nixosModules.stylix
	./modules/stylix
      ];
    };
  };
}
