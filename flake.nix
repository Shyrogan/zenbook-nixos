{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    stylix.url = "github:danth/stylix";
    Neve.url = "git+file:./modules/neve";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker.url = "github:abenz1267/walker";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = { self, nixpkgs, ... }@inputs: let
   inherit (self) outputs; 
  in {
    # Configuration for my Zenbook S16 that uses HX370 CPU
    nixosConfigurations = {
      mizu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./host/zenbook-s16
          ./modules/mizu
          ./modules/stylix
          ./modules/agenix
        ];
      };
    };
  };
}
