{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      home-manager
      catppuccin-cursors

      # Gnome
      nautilus
      gnome-disk-utility
      fragments
      gnome-tweaks
      papirus-icon-theme
      loupe
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
      zapzap
      ghostty
      blackbox-terminal

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
    nix-ld.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
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
    zapret = {
      enable = true;
      params = [
        "--filter-tcp=80 ˂HOSTLIST˃"
        "--dpi-desync=fake,fakedsplit"
        "--dpi-desync-autottl=2"
        "--dpi-desync-fooling=md5sig"
        "--new"
        "--filter-tcp=443"
        "--dpi-desync=fake,multidisorder"
        "--dpi-desync-fooling=badseq"
        "--dpi-desync-split-pos=midsld"
        "--dpi-desync-fake-tls=0x00000000"
      ];
      whitelist = [
        "googleusercontent.com"
        "accounts.google.com"
        "googleadservices.com"
        "googlevideo.com"
        "gvt1.com"
        "jnn-pa.googleapis.com"
        "play.google.com"
        "wide-youtube.l.google.com"
        "youtu.be"
        "youtube-nocookie.com"
        "youtube-ui.l.google.com"
        "youtube.com"
        "youtube.googleapis.com"
        "youtubeembeddedplayer.googleapis.com"
        "youtubei.googleapis.com"
        "yt-video-upload.l.google.com"
        "yt.be"
        "ytimg.com"
        "ggpht.com"
      ];
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    catnap = pkgs.callPackage ../myPackages/catnap/default.nix { };
    NeoHtop = pkgs.callPackage ../myPackages/NeoHtop/default.nix { };
    protonup-rs = pkgs.callPackage ../myPackages/protonup-rs/default.nix { };
    xmcl = pkgs.callPackage ../myPackages/XMCL/default.nix { };
    fzfm = pkgs.callPackage ../myPackages/fzfm/default.nix { };
    rmt = pkgs.callPackage ../myPackages/rmt/default.nix { };
    # ghostty = pkgs.ghostty.overrideAttrs (_: {
    #   version = "1.1.4-391290a-nix";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "ghostty-org";
    #     repo = "ghostty";
    #     rev = "f44c24ef88b9a663e760ad3a5a5866eb146b051e";
    #     hash = "sha256-H/rJ/svNsq8Y7+jXtsOUJVRdWmmQnHXxVZe3wAo4lYo=";
    #   };
    # });
  };

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
