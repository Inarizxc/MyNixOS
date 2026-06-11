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
      udiskie

      # Games
      heroic
      faugus-launcher
      elyprismlauncher

      # Terminal
      ghostty
      bat
      ripgrep
      zoxide
      fd
      fastfetch
      pingu
      bottom
      skim
      libarchive
      tealdeer
      gtt
      qemu
      todomgr
      rqbit

      # Shell
      nushell
      oh-my-posh
      carapace
      devenv

      # Editor
      helix
      emacs-gtk
      wl-clipboard

      # GUI
      piper
      libreoffice
      ayugram-desktop
      imv
      mpv
      zathura
      thunderbird
      localsend
      vesktop

      # File Manager
      superfile
      ouch

      # Screenshots & Screen Recorder
      satty
      gpu-screen-recorder

      # Nix
      nix-output-monitor
      nix-search-tv
      nvd

      # Git
      git
      jujutsu
    ])
    ++ [
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
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
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

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
