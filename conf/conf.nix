{ inputs, catppuccin, ... }:
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
      max-jobs = "auto";
      cores = 0;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = [ "inari" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.user.services.niri-flake-polkit.enable = false;

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.niri.overlays.niri
    ];
  };

  catppuccin.cache.enable = true;

  system.stateVersion = "25.11";
}
