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
      shellAliases = {
        cd = "z";
        c = "clear";
        rmdir = "rm -rf";
        cat = "bat";
        grep = "rg";
        find = "fd";
        du = "dua i";
        less = "bat";
        ls = "eza --tree --icons always --level 1";

        nv = "nvim";
        snv = "sudo -E nvim";

        nb = "sudo nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        nix-profile-collect-garbage = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than";
        conf = "sudo -E nvim ~/NixOS/";
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
  };

  programs.home-manager.enable = true;
}
