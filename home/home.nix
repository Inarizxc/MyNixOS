{
  config,
  pkgs,
  catppuccin,
  ...
}: {
  home.username = "inari";
  home.homeDirectory = "/home/inari";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/inari/.steam/root/compatibilitytools.d";
  };

  catppuccin = {
    enable = true;
    yazi.enable = true;
    bat.enable = true;
    fzf.enable = true;
    fish.enable = true;
    gtk = {
      enable = true;
      gnomeShellTheme = true;
      icon.enable = true;
    };
  };

  gtk.enable = true;

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
        "rounded-window-corners@fxgn"
        "solaar-extension@sidevesh"
      ];
    };
  };

  programs = {
    nushell = {
      enable = true;
      extraConfig = let
        flakeDir = "~/NixOS/";
      in ''
        source ~/.zoxide.nu

        alias cat = bat
        alias cd = z
        alias c = clear
        alias rmdir = rm -rf
        alias cat = bat
        alias grep = rg
        alias find = fd
        alias du = dua  i
        alias less = bat

        alias nv = nvim
        alias snv = sudo -E nvim

        alias rb = sudo nixos-rebuild switch --flake ${flakeDir}
        alias up = sudo nix flake update --flake ${flakeDir}
        alias hm = home-manager switch --flake ${flakeDir}
        alias nb = sudo nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
        alias nix-profile-collect-garbage = sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than
        alias conf = sudo -E nvim ${flakeDir}

        alias ns = nix-shell --command nu

        alias fuck = thefuck $"(history | last 1 | get command | get 0)"

        $env.config.edit_mode = "vi"
        $env.config.show_banner = false

        catnap
        source ~/.oh-my-posh.nu
        source ~/.cache/carapace/init.nu
      '';
      extraEnv = ''
        $env.EDITOR = "nvim"
        $env.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/inari/.steam/root/compatibilitytools.d"

        zoxide init nushell | save -f ~/.zoxide.nu
        $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
        mkdir ~/.cache/carapace
        carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
      '';
    };
    fzf.enable = true;
    yazi.enable = true;
    bat.enable = true;
  };

  programs.home-manager.enable = true;
}
