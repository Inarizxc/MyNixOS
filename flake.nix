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
    niri-very-refactor = {
      url = "github:sodiboo/niri-flake/very-refactor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
  outputs = {
    nixpkgs,
    home-manager,
    niri,
    niri-very-refactor,
    noctalia,
    catppuccin,
    nix-index-database,
    nix-flatpak,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    nixpkgsConf = {
      inherit system;
      overlays = [
        niri.overlays.niri
      ];
      config.allowUnfree = true;
    };
    pkgs = import nixpkgs nixpkgsConf;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs system;
      };
      inherit system;
      modules = [
        {nixpkgs = nixpkgsConf;}
        ./conf/conf.nix
        catppuccin.nixosModules.catppuccin
        niri.nixosModules.niri
        nix-index-database.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
    homeConfigurations."inari" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit inputs;
      };
      inherit pkgs;
      modules = [
        ./home/home.nix
        catppuccin.homeModules.catppuccin
        niri-very-refactor.homeModules.niri
      ];
    };
  };
}
