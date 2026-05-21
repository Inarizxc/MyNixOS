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
      xdg-desktop-portal-gtk
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
      numr
      gping
      bottom
      skim
      libarchive
      tldr
      gtt

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
      ghostty
      gnome-disk-utility
      loupe
      decibels
      impression
      showtime
      papers
      thunderbird
      bazaar
      localsend

      # File Manager
      nautilus
      file-roller
      superfile

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
    nix-index-database.comma.enable = true;
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
    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
        };
      };
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    xmcl = pkgs.callPackage ../myPackages/XMCL/package.nix { };
  };

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
