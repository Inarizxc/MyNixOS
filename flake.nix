{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-very-refactor = {
      url = "github:epireyn/niri-flake/very-refactor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
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
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    zapret-rust.url = "github:Sergeydigl3/zapret-discord-youtube-rust";
  };
  outputs = {
    nixpkgs,
    home-manager,
    niri,
    niri-very-refactor,
    noctalia,
    noctalia-greeter,
    catppuccin,
    nix-index-database,
    nix-flatpak,
    millennium,
    nix-cachyos-kernel,
    zapret-rust,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    commonOverlays = [
      (final: prev: {
        elyprismlauncher = prev.callPackage ./myPackages/ElyPrismLauncher/package.nix {};
        todomgr = prev.callPackage ./myPackages/todomgr/package.nix {};
      })
      niri.overlays.niri
      millennium.overlays.default
      nix-cachyos-kernel.overlays.pinned
    ];

    commonConfig = {
      problems.handlers.cups.broken = "warn";
      allowUnfree = true;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs system;
      };
      inherit system;
      modules = [
        {
          nixpkgs.overlays = nixpkgs.lib.mkBefore commonOverlays;
          nixpkgs.config = commonConfig;
        }

        ./conf/conf.nix
        catppuccin.nixosModules.catppuccin
        niri.nixosModules.niri
        nix-index-database.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        noctalia.nixosModules.default
        noctalia-greeter.nixosModules.default
      ];
    };
    homeConfigurations."inari" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit inputs;
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = commonOverlays;
        config = commonConfig;
      };
      modules = [
        ./home/home.nix
        catppuccin.homeModules.catppuccin
        niri-very-refactor.homeModules.niri
      ];
    };
  };
}
