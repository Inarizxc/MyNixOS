{ pkgs, ... }:
{
  programs.fish = {

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
        name = "replay.fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "replay.fish";
          rev = "d2ecacd3fe7126e822ce8918389f3ad93b14c86c";
          sha256 = "sha256-TzQ97h9tBRUg+A7DSKeTBWLQuThicbu19DHMwkmUXdg=";
        };
      }
    ];
    shellAliases =
      let
        flakeDir = "~/NixOS/";
      in
      {
        cd = "z";
        c = "clear";
        cat = "bat --paging=never";
        grep = "rg";
        find = "fd";
        less = "bat";
        ls = "eza --tree --icons always --level 1";
        rm = "rmt";
        rmd = "rmt --destroy";

        shx = "sudo env \"HOME=$HOME\" hx";

        nos = "nh os switch";
        nhs = "nh home switch";
        up = "sudo nix flake update --flake ${flakeDir}";

        conf = "sudo env \"HOME=$HOME\" hx ${flakeDir}";
        nd = "nom develop --command fish";
        ns = "nom-shell --command fish";

        nb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
      };
    shellInit =
      # BASH
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

        set -gx SSH_ASKPASS

        set -gx fish_greeting

        set -Ux fifc_editor hx

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
}
