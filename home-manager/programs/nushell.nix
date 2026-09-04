{pkgs, ...}: {
  programs.nushell = let
    flakeDir = "/home/inari/NixOS";
  in {
    enable = true;
    loadSessionVariables = true;
    settings = {
      show_banner = false;
      edit_mode = "helix";
      buffer_editor = "hx";
      use_kitty_protocol = true;
      completions = {
        external = {
          enable = true;
          max_results = 200;
        };
      };
    };
    plugins = with pkgs.nushellPlugins; [
      skim
      formats
    ];
    extraConfig =
      /*
      nu
      */
      ''
        $env.config.hooks.display_output = {||
          table --icons
        }

        def ns [...p: string] {
          if ($p | is-empty) {
            with-env {IN_NIX_SHELL: "impure"} {nom shell}
          } else {
              let pkgs = ($p | each {|pkg| $"nixpkgs#($pkg)"})
              with-env {IN_NIX_SHELL: "impure"} {nom shell ...$pkgs}
          }
        }

        def rb [--update(-u), --variant(-v): string = "switch"] {
          let choice = (["system" "home-manager" "all" "clear"] | input list)
          if $update {
            nom flake update --flake ${flakeDir}
          }
          match $choice {
            "system" => {nh os $variant}
            "home-manager" => {nh home $variant}
            "all" => {
              nh os $variant
              nh home $variant
            }
            "clear" => {
              sudo su -c "rm -rfv /boot/limine/kernels/*"
              nh clean all
              nh os switch
              print ""
              sudo ls /boot/limine/kernels
            }
            _ => null
          }
        }

        def conf [] {
          let choice = (
            ["packages" "nushell" "noctalia" "helix" "ghostty" "niri" "services" "flake"]
            | input list --fuzzy --multi --no-footer
          )

          let dict = {
            packages: "${flakeDir}/packages.nix"
            nushell: "${flakeDir}/home-manager/programs/nushell.nix"
            noctalia: "${flakeDir}/home-manager/programs/noctalia.nix"
            helix: "${flakeDir}/home-manager/programs/helix.nix"
            ghostty: "${flakeDir}/home-manager/programs/ghostty.nix"
            services: "${flakeDir}/modules/services.nix"
            flake: "${flakeDir}/flake.nix"
          }

          let files = $choice | each {|file|
            if $file == "niri" {
              ["settings" "binds"] | input list --multi --no-footer
              | each {|s|
                  match $s {
                    "settings" => "${flakeDir}/home-manager/programs/niri/settings.nix"
                    "binds"    => "${flakeDir}/home-manager/programs/niri/binds.nix"
                  }
                }
            } else {
              $dict | get $file
            }
          } | default [] | flatten

          if ($files | is-empty) {
            hx ${flakeDir}
          } else {
            hx -w ${flakeDir} ...$files
          }
        }

        def zapret [] {
          let choice = (["start" "status" "config" "restart" "stop"] | input list)
          if ($choice | is-empty) {return}
          match $choice {
            "config" => {
              let file = (["general" "exclude"] | input list)
              if ($file | is-empty) {return}
               sudo env HOME=($env.HOME) hx $"/var/lib/zapret-rust/zapret-discord-youtube-linux/lists/list-($file)-user.txt"
              systemctl restart zapret-rust
            }
            _ => {systemctl $choice zapret-rust}
          }
        }

        def --env mkd [dir: path] {
          mkdir $dir
          cd $dir
        }
        def fetch [url: string, file: path] {http get $url | save --progress $file}
        try {fastfetch}
        try {todomgr --path $env.home ls}
      '';
    environmentVariables = {
      EDITOR = "hx";
      NH_FLAKE = flakeDir;
      SSH_ASKPASS = null;

      PROMPT_INDICATOR_VI_NORMAL = " ";
      PROMPT_INDICATOR_VI_INSERT = " ";
    };
    shellAliases = {
      cd = "z";
      c = "clear";
      cat = "open";
      less = "bat --plain";
      grep = "rg";
      find = "fd";
      ping = "pingu";
      btm = "btm -c";
      top = "btm -b";
      spf = "superfile";
      tar = "bsdtar";
      cpio = "bsdcpio";
      fzf = "sk";
      ls = "ls -s";
      rqbitdw = "rqbit download -e -o /run/media/inari/Games/";
      zapret-rust = "sudo zapret-rust -d ~/.cache/zapret-rust/";

      td = "todomgr";
      htd = "todomgr --path ~";

      shx = "sudo env HOME=($env.HOME) hx";

      up = "nom flake update --flake ${flakeDir}";
      nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./package.nix { }'";

      emacs = "~/.config/emacs/bin/doom emacs";
    };
  };
}
