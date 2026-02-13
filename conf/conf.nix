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
      max-jobs = 40;
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
      options = "--delete-older-than 7d";
    };

    settings.trusted-users = [ "inari" ];
  };

  systemd.user.services.niri-flake-polkit.enable = false;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
