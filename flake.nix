{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      niri,
      catppuccin,
      nix-index-database,
      nix-flatpak,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          niri.overlays.niri
        ];
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        system = system;
        modules = [
          ./conf/conf.nix
          catppuccin.nixosModules.catppuccin
          niri.nixosModules.niri
          nix-index-database.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      homeConfigurations."inari" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/home.nix
          catppuccin.homeModules.catppuccin
          niri.homeModules.niri
        ];
      };
    };
}
