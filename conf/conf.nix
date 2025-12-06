{ ... }:
{
  imports = [
    ./packages.nix
    ./modules/bundle.nix
  ];

  nix = {
    extraOptions = ''
      warn-dirty = false
    '';
    settings = {
      cores = 8;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1d";
    };

    settings.trusted-users = [ "inari" ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
