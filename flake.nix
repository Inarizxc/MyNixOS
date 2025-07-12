{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };
  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    solaar,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      system = system;
      modules = [
        ./conf/conf.nix
        catppuccin.nixosModules.catppuccin
        solaar.nixosModules.default
      ];
    };
    homeConfigurations."inari" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home/home.nix catppuccin.homeModules.catppuccin];
    };
  };
}
