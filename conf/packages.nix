{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      # Env
      noctalia-shell
      xdg-desktop-portal-gnome
      home-manager
      papirus-icon-theme
      catppuccin-cursors.mochaDark
      wlr-which-key

      # Games
      protonplus
      heroic
      faugus-launcher
      xmcl

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
      bottom
      skim
      libarchive
      tldr

      # Shell
      nushell
      oh-my-posh
      carapace

      # Editor
      helix
      emacs-gtk
      neovim
      wl-clipboard
      alejandra

      # GUI
      piper
      fragments
      libreoffice
      ayugram-desktop
      vesktop
      ghostty
      gnome-disk-utility
      dialect
      loupe
      decibels
      impression
      nautilus
      file-roller
      showtime
      papers
      thunderbird
      bazaar

      # Screenshots & Screen Recorder
      grim
      slurp
      swappy
      gpu-screen-recorder

      # Virtualisation
      qemu
      qemu_kvm

      # Nix
      nix-output-monitor
      nvd
      comma
      hydra-check
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
