{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      home-manager

      # Gnome
      nautilus
      gnome-boxes
      gnome-calculator
      gnome-disk-utility
      fragments
      gnome-tweaks
      epapirus-icon-theme
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

      # Configuration
      solaar
      piper

      # Terminal
      bat
      ripgrep
      fzf
      zoxide
      fd
      dua
      joshuto
      oh-my-posh
      catnap
      eza
      carapace
      file
      thefuck

      # Neovim
      neovim
      nixd
      wl-clipboard
      alejandra

      # GUI
      NeoHtop
      libreoffice
      kotatogram-desktop
      varia
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
    ])
    ++ [
      inputs.zen-browser.packages."x86_64-linux".beta
    ];

  programs = {
    firefox.enable = true;
    nh.enable = true;
    virt-manager.enable = true;

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
    emacs.enable = true;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    catnap = pkgs.callPackage ../myPackages/catnap/default.nix {};
    NeoHtop = pkgs.callPackage ../myPackages/NeoHtop/default.nix {};
    protonup-rs = pkgs.callPackage ../myPackages/protonup-rs/default.nix {};
    xmcl = pkgs.callPackage ../myPackages/XMCL/default.nix {};
    varia = pkgs.callPackage ../myPackages/varia/default.nix {};
  };

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
