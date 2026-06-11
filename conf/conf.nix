{lib, ...}: {
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
      min-free = 1 * 1024 * 1024 * 1024;
      max-free = 5 * 1024 * 1024 * 1024;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = ["inari"];

      substituters = lib.mkAfter [
        "https://mirror.yandex.ru/nixos"
        "https://ncproxy.vizqq.cc"
        "https://nixos-cache-proxy.cofob.dev"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.kz"
        "https://nixos-cache-proxy.sweetdogs.ru"

        "https://noctalia.cachix.org"
      ];

      trusted-public-keys = lib.mkAfter [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.user.services.niri-flake-polkit.enable = false;

  catppuccin.cache.enable = true;

  system.stateVersion = "25.11";
}
