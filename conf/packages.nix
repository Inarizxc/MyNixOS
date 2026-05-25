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
      home-manager
      papirus-icon-theme
      catppuccin-cursors.mochaDark
      wlr-which-key

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

      # Shell
      nushell
      oh-my-posh
      carapace

      # Editor
      helix
      emacs-gtk
      wl-clipboard
      alejandra

      # GUI
      piper
      fragments
      libreoffice
      ayugram-desktop
      ghostty
      gnome-disk-utility
      imv
      mpv
      zathura
      thunderbird
      bazaar
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
      nvd

      # Git
      git
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
    nh.enable = true;
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

  nixpkgs.overlays = [
    (final: prev: {
      elyprismlauncher = final.callPackage ../myPackages/ElyPrismLauncher/package.nix { };
    })
  ];

  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
