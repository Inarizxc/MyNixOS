{
  inputs,
  catppuccin,
  lib,
  ...
}: {
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
      connect-timeout = 4;
      stalled-download-timeout = 4;
      fallback = true;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = ["inari"];

      substituters = lib.mkAfter [
        "https://mirror.yandex.ru/nixos"
        "https://cache.nixos.kz"
        "https://ncproxy.vizqq.cc"
        "https://nixos-cache-proxy.cofob.dev"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.user.services.niri-flake-polkit.enable = false;

  # nixpkgs = {
  #   config.allowUnfree = true;
  #   overlays = [
  #     inputs.niri.overlays.niri
  #   ];
  # };

  catppuccin.cache.enable = true;

  system.stateVersion = "25.11";
}
