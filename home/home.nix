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
    FLAKE = "/home/inari/NixOS";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/inari/.steam/root/compatibilitytools.d";
  };

  catppuccin = {
    enable = true;
    yazi.enable = true;
    bat.enable = true;
    fzf.enable = true;
    fish.enable = true;
    lazygit.enable = true;
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
        "space-bar@luchrioh"
        "openbar@neuromorph"
        "just-perfection-desktop@just-perfection"
      ];
    };
  };

  programs = {
    fish = {
      enable = true;
      plugins = [
        {
          name = "fzf.fish";
          src = pkgs.fetchFromGitHub {
            owner = "PatrickF1";
            repo = "fzf.fish";
            rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
            sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
          };
        }
      ];
      shellAliases = let
        flakeDir = "~/NixOS/";
      in {
        cd = "z";
        c = "clear";
        rmdir = "rm -rf";
        cat = "bat";
        grep = "rg";
        find = "fd";
        du = "dua i";
        less = "bat";
        ls = "eza --tree --icons always --level 1";

        nv = "nix run ${flakeDir}/NVF/ --";
        snv = "sudo nix run ${flakeDir}/NVF/ --";

        conf = "sudo nix run ${flakeDir}/NVF ${flakeDir}";

        nb = "sudo nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        nix-profile-collect-garbage = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than";
      };
      shellInit = ''
        catnap
        oh-my-posh init fish --config ~/.config/oh-my-posh/catppuccin.omp.json | source
        thefuck --alias | source
        zoxide init fish | source

        function rerender_on_bind_mode_change --on-variable fish_bind_mode
            if test "$fish_bind_mode" != paste -a "$fish_bind_mode" != "$FISH__BIND_MODE"
                set -gx FISH__BIND_MODE $fish_bind_mode
                omp_repaint_prompt
            end
        end
        function fish_default_mode_prompt --description "Display vi prompt mode"
            # This function is masked and does nothing
        end
      '';
    };
    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    thefuck = {
      enable = true;
      enableFishIntegration = true;
    };
    oh-my-posh = {
      enable = true;
      enableFishIntegration = true;
    };
    bat = {
      enable = true;
    };
    lazygit = {
      enable = true;
    };
  };

  programs.home-manager.enable = true;
}
