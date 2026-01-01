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
        completions.external = {
          enable = true;
          max_results = 200;
        };
      };
      extraConfig = let
        conf = "sudo env HOME=($env.HOME) hx ${flakeDir}";
      in ''
        def nix-shell [p?: string] {
          match $p {
            null => {nom-shell --command "nu"}
            _ => {nom-shell -p $p --command "nu"}
          }
        }
        def ns [p?: string] {
          match $p {
            null => {nom-shell --command "nu"}
            _ => {nom-shell -p $p --command "nu"}
          }
        }
        def rb [p?: string] {
          match $p {
            "home-manager" | "hm" => {nh home switch}
            "update" | "up" => {
              sudo nix flake update --flake ${flakeDir}
              nh os switch
            }
            "clear" | "c" => {
              sudo su -c "rm -rf /boot/limine/kernels/*"
              nh clean all
              nh os switch
            }

            _ | "os" => {nh os switch}
          }
        }
        def conf [p?: string] {
          match $p {
            "niri" => {hx ~/.config/niri/config.kdl}
            "nushell" | "nu" => {${conf}/home/programs/nushell.nix}
            "helix" | "hx" | "h" => {${conf}/home/programs/helix.nix}
            "ghostty" | "g" => {${conf}/home/programs/ghostty.nix}
            "packages" | "pkgs" | "p" => {${conf}/conf/packages.nix}
            "services" | "serv" | "s" => {${conf}/conf/modules/services.nix}
            "flake" | "f" => {${conf}/flake.nix}
            _ => {${conf}}
          }
        }
        fastfetch
        glow ~/Documents/Notes/TODO.md
      '';
      environmentVariables = {
        PROMPT_INDICATOR_VI_NORMAL = ": ";
        PROMPT_INDICATOR_VI_INSERT = "> ";
        SSH_ASKPASS = "";
      };
      plugins = with pkgs.nushellPlugins; [
        formats
        highlight
        skim
        semver
        gstat
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
        rw = "rawst --color always --threads 8 --output-file-path";
        ze = "zeditor .";
        spf = "superfile";

        shx = "sudo env HOME=($env.HOME) hx";

        up = "sudo nix flake update --flake ${flakeDir}";

        nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        snb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
      };

    };
}
