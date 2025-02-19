# !TODO
# Cделать это читабельнее
{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      home-manager
      nautilus
      gnome-boxes
      gnome-calculator
      gnome-disk-utility
      fragments
      gnome-tweaks
      protonup-rs
      solaar
      heroic
      # ollama-cuda
      bat
      ripgrep
      fzf
      zoxide
      telegram-desktop
      oh-my-posh
      fd
      dua
      epapirus-icon-theme
      catnap
      joshuto
      nixd
      piper
      libreoffice
      qemu
      qemu_kvm
      NeoHtop
      neovim
      ModrinthApp
      eog
      git
      wl-clipboard
      thefuck
      showtime
      papers
      alejandra
      carapace
      ghostty
      nix-output-monitor
      nvd
      eza
      virglrenderer
      lazygit
      gedit
      carapace
      file

      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
      gnomeExtensions.appindicator
      gnomeExtensions.vitals
      gnomeExtensions.gsconnect
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.rounded-window-corners-reborn
      gnomeExtensions.solaar-extension
      # gnomeExtensions.pop-shell
      gnomeExtensions.open-bar
      gnomeExtensions.space-bar
      gnomeExtensions.quick-settings-tweaker
      gnomeExtensions.just-perfection
    ])
    ++ [
      inputs.zen-browser.packages."x86_64-linux".beta
    ];

  programs.nix-ld.enable = true;
  programs.firefox.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
  ];
  programs.nh.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf.enable = true;
    };
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
  };

  systemd.tmpfiles.rules = let
    firmware = pkgs.runCommandLocal "qemu-firmware" {} ''
      mkdir $out
      cp ${pkgs.qemu}/share/qemu/firmware/*.json $out
      substituteInPlace $out/*.json --replace ${pkgs.qemu} /run/current-system/sw
    '';
  in ["L+ /var/lib/qemu/firmware - - - - ${firmware}"];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  nixpkgs.config.packageOverrides = pkgs: {
    # zen-browser = pkgs.callPackage ../nonNixPackages/zen-browser/default.nix { };
    catnap = pkgs.callPackage ../nonNixPackages/catnap/default.nix {};
    NeoHtop = pkgs.callPackage ../nonNixPackages/NeoHtop/default.nix {};
    ModrinthApp = pkgs.callPackage ../nonNixPackages/astralrinth/default.nix {};
    protonup-rs = pkgs.callPackage ../nonNixPackages/protonup-rs/default.nix {};
  };

  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # services.ollama.enable = true;
  services.ratbagd.enable = true;
  services.solaar.enable = true;
  services.flatpak.enable = true;
  # services.solaar = {
  #    enable = true;
  #   package = pkgs.solaar;
  #    window = "hide";
  #    batteryIcons = "regular";
  #    extraArgs = "";
  #  };
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = [pkgs.gnome-tour];
  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.desktopManager.xterm.enable = false;
  documentation.nixos.enable = false;
  programs.nano.enable = false;
}
