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
      catppuccin-cursors.mochaDark

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
      fastfetch
      rawst
      superfile
      numr
      pingu
      glow
      bottom

      # Shell
      nushell
      nix-your-shell
      oh-my-posh
      carapace

      # Editor
      zed-editor
      helix
      emacs-gtk
      neovim
      wl-clipboard
      alejandra

      # GUI
      fragments
      libreoffice
      ayugram-desktop
      ghostty
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
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
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

  nixpkgs.config.packageOverrides = pkgs: {
    xmcl = pkgs.callPackage ../myPackages/XMCL/default.nix { };
    rawst = pkgs.callPackage ../myPackages/rawst/default.nix { };
  };

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
