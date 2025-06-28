{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      home-manager
      catppuccin-cursors

      # Gnome
      nautilus
      sums
      gnome-disk-utility
      fragments
      gnome-tweaks
      papirus-icon-theme
      eog
      showtime
      papers
      cartridges
      gnome-clocks
      gnome-weather
      gnome-maps
      gnome-calendar
      decibels

      # Games
      protonup-rs
      heroic
      lutris
      xmcl
      hydralauncher

      # Configuration
      solaar
      piper

      # Terminal
      bat
      ripgrep
      fzf
      zoxide
      fd
      oh-my-posh
      catnap
      eza
      carapace
      file
      python313Packages.downloader-cli
      fzfm
      rmt

      # Editor
      helix
      emacs-gtk
      nixd
      nil
      wl-clipboard
      alejandra

      # GUI
      NeoHtop
      libreoffice
      kotatogram-desktop
      ghostty

      # Virtualisation
      qemu
      qemu_kvm

      # Nix
      nix-output-monitor
      nvd
      comma
      nix-index

      # Git
      gitFull
      lazygit

      # Gnome extensions
      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
      gnomeExtensions.appindicator
      gnomeExtensions.vitals
      gnomeExtensions.gsconnect
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.rounded-window-corners-reborn
      gnomeExtensions.solaar-extension
      gnomeExtensions.space-bar
      gnomeExtensions.quick-settings-tweaker
      gnomeExtensions.just-perfection
      gnomeExtensions.quick-settings-tweaker
      gnomeExtensions.user-themes
    ])
    ++ [
      # Zen Browser
      inputs.zen-browser.packages."x86_64-linux".beta

      # Nix-alien
      inputs.nix-alien.packages."x86_64-linux".nix-alien

      # Qemu UEFI
      (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
        qemu-system-x86_64 \
          -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
          "$@"
      '')
    ];

  programs = {
    nh.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        icu
      ];
    };

    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  services = {
    ratbagd.enable = true;
    solaar.enable = true;
    flatpak.enable = true;
    ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    catnap = pkgs.callPackage ../myPackages/catnap/default.nix {};
    NeoHtop = pkgs.callPackage ../myPackages/NeoHtop/default.nix {};
    protonup-rs = pkgs.callPackage ../myPackages/protonup-rs/default.nix {};
    xmcl = pkgs.callPackage ../myPackages/XMCL/default.nix {};
    fzfm = pkgs.callPackage ../myPackages/fzfm/default.nix {};
    rmt = pkgs.callPackage ../myPackages/rmt/default.nix {};
    };

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
