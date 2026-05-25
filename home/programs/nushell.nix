{ pkgs, ... }:
{
  programs.nushell =
    let
      flakeDir = "~/NixOS";
    in
    {
      enable = true;
      settings = {
        show_banner = false;
        edit_mode = "vi";
        buffer_editor = "hx";
        use_kitty_protocol = true;
        completions = {
          # algorithm = "fuzzy";
          external = {
            enable = true;
            max_results = 200;
          };
        };
      };
      extraConfig =
        let
          conf = "sudo env HOME=($env.HOME) hx ${flakeDir}";
        in
        /* nu */ ''
          def ns [...p: string] {
            match $p {
              [] => { nom-shell --command "nu" }
              _ => { nom-shell -p ...$p --command "nu" }
            }
          }
          def rb [p?: string] {
            match $p {
              "home-manager" | "hm" | "h" => {nh home switch}
              "update" | "up" | "u" => {
                sudo nix flake update --flake ${flakeDir}
                nh os switch
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
            }
          }
          fastfetch
          ~/Projects/rust/todomgr/result/bin/todomgr --path ~ ls
        '';
      environmentVariables = {
        EDITOR = "hx";
        NH_FLAKE = "/home/inari/NixOS";
        PROMPT_INDICATOR_VI_NORMAL = " ";
        PROMPT_INDICATOR_VI_INSERT = " ";
        SSH_ASKPASS = "";
      };
      plugins = with pkgs.nushellPlugins; [
        formats
        skim
        semver
        gstat
      ];
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
        ze = "zeditor .";
        spf = "superfile";
        tar = "bsdtar";
        cpio = "bsdcpio";
        fzf = "sk";
        ls = "ls -s";

        todomgr = "~/Projects/rust/todomgr/result/bin/todomgr";
        todo = "~/Projects/rust/todomgr/result/bin/todomgr --path ~";

        shx = "sudo env HOME=($env.HOME) hx";

        up = "sudo nix flake update --flake ${flakeDir}";

        nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        nbp = "nom-build -E 'with import <nixpkgs> { }; callPackage ./package.nix { }'";
        snb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";

        emacs = "~/.config/emacs/bin/doom emacs";
      };

    };
}
