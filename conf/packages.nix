{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      home-manager
      papirus-icon-theme
      xdg-desktop-portal-gnome

      # Games
      protonplus
      heroic
      lutris
      faugus-launcher
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
      oh-my-posh
      fastfetch
      carapace
      rawst
      joshuto

      # Shell
      nushell
      nix-your-shell

      # Editor
      zed-editor
      helix
      emacs-gtk
      nixd
      nil
      wl-clipboard
      alejandra

      # GUI
      fragments
      mission-center
      libreoffice
      ayugram-desktop
      ghostty
      gnome-calculator
      planify
      gnome-disk-utility
      dialect
      loupe
      decibels
      impression
      nautilus
      showtime
      papers
      thunderbird

      # Screenshots
      grim
      slurp
      swappy

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

      # Noctalia Shell
      inputs.noctalia.packages."x86_64-linux".default
    ];

  programs = {
    nix-ld.enable = true;
    nh = {
      enable = true;
      package = (
        pkgs.symlinkJoin {
          name = "nh";
          buildInputs = [ pkgs.makeWrapper ];
          paths = [ pkgs.nh ];
          postBuild = ''
            wrapProgram $out/bin/nh \
            --set NH_FLAKE "/home/inari/NixOS"
          '';
        }
      );
    };
    # hyprland.enable = true;
    # waybar.enable = true;
    niri.enable = true;
    xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };

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
    udisks2.enable = true;
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
        "modrinth.com"
        "rutracker.org"
        "discord-attachments-uploads-prd.storage.googleapis.com"
        "discord.app"
        "discord.co"
        "discord.com"
        "discord.design"
        "discord.dev"
        "discord.gift"
        "discord.gifts"
        "discord.gg"
        "discord.media"
        "discord.new"
        "discord.store"
        "discord.status"
        "discord-activities.com"
        "discordactivities.com"
        "discordapp.com"
        "discordapp.net"
        "discordcdn.com"
        "discordmerch.com"
        "discordpartygames.com"
        "discordsays.com"
        "discordsez.com"
      ];
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    xmcl = pkgs.callPackage ../myPackages/XMCL/default.nix { };
    rawst = pkgs.callPackage ../myPackages/rawst/default.nix { };
  };

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
