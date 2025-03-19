{...}: {
  imports = [
    ./packages.nix
    ./modules/bundle.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
