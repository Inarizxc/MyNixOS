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
              }
              "boot" | "b" => {nh os boot}
              _ | "os" => {nh os switch}
            }
          }
          def conf [p?: string] {
            match $p {
              "niri" | "ni" => {${conf}/home/programs/niri.nix}
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
          try {bat ~/Documents/Notes/TODO.md --decorations never --paging never}
        '';
      environmentVariables = {
        PROMPT_INDICATOR_VI_NORMAL = "󰘧 ";
        PROMPT_INDICATOR_VI_INSERT = "  ";
        SSH_ASKPASS = "";
      };
      # plugins = with pkgs.nushellPlugins; [
      #   formats
      #   highlight
      #   skim
      #   semver
      #   gstat
      # ];
      shellAliases = {
        cd = "z";
        c = "clear";
        cat = "bat --paging=never --decorations=never";
        grep = "rg";
        find = "fd";
        ping = "pingu";
        btm = "btm -c";
        top = "btm -b";
        rw = "rawst --color always --threads 8";
        rwo = "rawst --color always --threads 8 --output-file-path";
        ze = "zeditor .";
        spf = "superfile";
        tar = "bsdtar";
        cpio = "bsdcpio";
        fzf = "sk";

        shx = "sudo env HOME=($env.HOME) hx";
        todo = "hx ~/Documents/Notes/TODO.md";

        up = "sudo nix flake update --flake ${flakeDir}";

        nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        snb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
      };

    };
}
