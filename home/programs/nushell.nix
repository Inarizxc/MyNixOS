{pkgs, ...}: {
  programs.nushell = let
    flakeDir = "~/NixOS";
  in {
    enable = true;
    settings = {
      show_banner = false;
      edit_mode = "vi";
      buffer_editor = "hx";
      use_kitty_protocol = true;
      completions = {
        external = {
          enable = true;
          max_results = 200;
        };
      };
    };
    extraConfig = let
      conf = "hx ${flakeDir}";
    in
      /*
      nu
      */
      ''
        $env.config.hooks.display_output = {||
          table --icons
        }

        def ns [...p: string] {
          match $p {
            [] => { with-env {IN_NIX_SHELL: "impure"} {nix shell} }
            _ => {
              let pkgs = ($p | each {|pkg| $"nixpkgs#($pkg)"})
              with-env {IN_NIX_SHELL: "impure"} {nix shell ...$pkgs}
            }
          }
        }
        def rb [p?: string] {
          match $p {
            "home-manager" | "hm" | "h" => {nh home switch}
            "update" | "up" | "u" => {
              nh os switch --update
            }
            "clear" | "c" => {
              sudo su -c "rm -rf /boot/limine/kernels/*"
              nh clean all
              nh os switch
              print ""
              sudo ls /boot/limine/kernels
            }
            "boot" | "b" => {nh os boot}
            "all" | "a" => {
              nh os switch
              nh home switch
            }
            _ | "os" => {nh os switch}
          }
        }
        def conf [p1?: string, p2?: string] {
          match $p1 {
            "niri" | "ni" => {
              match $p2 {
                "settings" | "s" => {${conf}/home/programs/niri/settings.nix}
                "binds" | "b" => {${conf}/home/programs/niri/binds.nix}
                "other" | "o" => {${conf}/home/programs/niri/other.kdl}
                _ => {${conf}/home/programs/niri}
              }
            }
            "nushell" | "nu" => {${conf}/home/programs/nushell.nix}
            "helix" | "hx" | "h" => {${conf}/home/programs/helix.nix}
            "ghostty" | "g" => {${conf}/home/programs/ghostty.nix}
            "packages" | "pkgs" | "p" => {${conf}/conf/packages.nix}
            "services" | "serv" | "s" => {${conf}/conf/modules/services.nix}
            "flake" | "f" => {${conf}/flake.nix}
            _ => {${conf}}
          }
        }
        def zapret [p: string] {
          match $p {
            "restart" | "r" => {systemctl restart zapret}
            "list" | "l" => {hx ~/NixOS/conf/modules/zapret/.shared/zapret/zapret-latest/lists/list-general-user.txt}
            "conf" | "c" => {hx ~/NixOS/conf/modules/zapret/.shared/zapret/conf.env}
          }
        }
        def search [] {nix-search-tv print | sk --preview 'nix-search-tv preview {}'}
        try {source ~/.cache/devenv/hook.nu}
        try {fastfetch}
        try {todomgr --path ~ ls}
      '';
    environmentVariables = {
      EDITOR = "hx";
      NH_FLAKE = "/home/inari/NixOS";
      PROMPT_INDICATOR_VI_NORMAL = " ";
      PROMPT_INDICATOR_VI_INSERT = " ";
      SSH_ASKPASS = "";
    };
    shellAliases = {
      cd = "z";
      c = "clear";
      cat = "bat --paging=never --decorations=never";
      grep = "rg";
      find = "fd";
      ping = "pingu";
      btm = "btm -c";
      top = "btm -b";
      rw = "rawst --color always";
      rwo = "rawst --color always --output-file-path";
      spf = "superfile";
      tar = "bsdtar";
      cpio = "bsdcpio";
      fzf = "sk";
      ls = "ls -s";

      td = "todomgr";
      htd = "todomgr --path ~";

      shx = "sudo env HOME=($env.HOME) hx";

      up = "nix flake update --flake ${flakeDir}";
      nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./package.nix { }'";

      emacs = "~/.config/emacs/bin/doom emacs";
    };
  };
}
