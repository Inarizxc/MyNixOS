{
  pkgs,
  inputs,
  system,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      # Env
      home-manager
      papirus-icon-theme
      catppuccin-cursors.mochaDark
      wlr-which-key
      adw-gtk3

      # Games
      protonplus
      heroic
      faugus-launcher
      elyprismlauncher

      # Terminal
      bat
      ripgrep
      zoxide
      fd
      fastfetch
      rawst
      numr
      pingu
      bottom
      skim
      libarchive
      tealdeer
      gtt
      qemu
      todomgr

      # Shell
      nushell
      oh-my-posh
      carapace
      devenv

      # Editor
      helix
      emacs-gtk
      wl-clipboard
      alejandra

      # GUI
      piper
      qbittorrent
      libreoffice
      ayugram-desktop
      ghostty
      gnome-disk-utility
      imv
      mpv
      zathura
      thunderbird
      localsend
      vesktop

      # File Manager
      nemo
      superfile
      ouch

      # Screenshots & Screen Recorder
      wayshot
      satty
      gpu-screen-recorder

      # Nix
      nix-output-monitor
      nix-search-tv
      nvd

      # Git
      git
      lazygit
      jujutsu
    ])
    ++ [
      # Noctalia
      inputs.noctalia.packages.${system}.default

      # Zen Browser
      inputs.zen-browser.packages.${system}.beta

      # Qemu UEFI
      (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
        qemu-system-x86_64 \
          -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
          "$@"
      '')
    ];

  programs = {
    nix-ld.enable = true;
    nix-index-database.comma.enable = true;
    nh.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    # update.onActivation = true;
    remotes = [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "org.vinegarhq.Sober"
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      elyprismlauncher = final.callPackage ../myPackages/ElyPrismLauncher/package.nix {};
      todomgr = final.callPackage ../myPackages/todomgr/package.nix {};
    })
  ];

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
