{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      plugins = [
        {
          name = "fzf.fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "fifc";
          src = pkgs.fetchFromGitHub {
            owner = "gazorby";
            repo = "fifc";
            rev = "a01650cd432becdc6e36feeff5e8d657bd7ee84a";
            sha256 = "sha256-Ynb0Yd5EMoz7tXwqF8NNKqCGbzTZn/CwLsZRQXIAVp4=";
          };
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
        {
          name = "bass";
          src = pkgs.fishPlugins.bass.src;
        }
      ];
      shellAliases = let
        flakeDir = "~/NixOS/";
      in {
        cd = "z";
        c = "clear";
        rmdir = "rm -rf";
        cat = "bat --paging=never";
        grep = "rg";
        find = "fd";
        du = "dua i";
        less = "bat";
        ls = "eza --tree --icons always --level 1";

        nv = "nix run --option warn-dirty false ${flakeDir}NVF/ --";
        snv = "sudo nix run --option warn-dirty false ${flakeDir}NVF/ --";
        note = "nix run --option warn-dirty false ${flakeDir}NVF/ -- /home/inari/Documents/Notes/index.norg";

        up = "sudo nix flake update --flake ${flakeDir} && sudo nix flake update --flake ${flakeDir}";

        conf = "sudo nix run --option warn-dirty false ${flakeDir}NVF ${flakeDir}";
        nd = "nom develop --command fish";
        ns = "nom-shell --command fish";

        nb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
      };
      shellInit =
        /*
        BASH
        */
        ''
          if status is-interactive
            catnap
          end
          carapace _carapace fish | source
          oh-my-posh init fish --config ~/.config/oh-my-posh/catppuccin.omp.json | source
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

          set -Ux fifc_editor nvim

          set -gx fifc_spinner '⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'

          set -gx FZF_DEFAULT_OPTS "
            --height=40% --reverse --border
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
            --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
            --preview-window=right:60%:wrap
            --bind 'tab:down,btab:up'
            --bind 'ctrl-j:down,ctrl-k:up'
            --bind 'space:toggle'
            --cycle
            --multi
            --ignore-case
          "
        '';
    };
    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
        font-size = "15";
      };
    };
    git = {
      enable = true;
      userEmail = "veprevmaksim08@gmail.com";
      userName = "Inarizxc";
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
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
}
