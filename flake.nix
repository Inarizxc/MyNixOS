{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };
  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    solaar,
    zen-browser,
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
        ./conf/configuration.nix
        catppuccin.nixosModules.catppuccin
        solaar.nixosModules.default
      ];
    };
    homeConfigurations."inari" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home/home.nix catppuccin.homeManagerModules.catppuccin];
    };
  };
}
