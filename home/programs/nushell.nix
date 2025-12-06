{ pkgs, ... }:
{
  programs.nushell = {
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
    extraConfig = ''
      def cnos [] {
        sudo su -c "rm -rf /boot/limine/kernels/*"
        nh clean all
        nh os switch
      }
      def unos [] {
        sudo nix flake update --flake ~/NixOS
        nh os switch
      }
      def mgames [] {
        sudo mkdir -p /run/media/inari/Games/
        sudo mount /dev/sda1 /run/media/inari/Games/
      }
      fastfetch
    '';
    environmentVariables = {
      PROMPT_INDICATOR_VI_NORMAL = ": ";
      PROMPT_INDICATOR_VI_INSERT = "> ";
      SSH_ASKPASS = "";
    };
    plugins = with pkgs.nushellPlugins; [
      formats
      # highlight
      skim
      semver
      gstat
    ];
    shellAliases =
      let
        flakeDir = "~/NixOS/";
      in
      {
        cd = "z";
        c = "clear";
        cat = "bat --paging=never --decorations=never";
        grep = "rg";
        find = "fd";
        rawst = "rawst --color always --threads 8 --output-file-path";
        ze = "zeditor .";

        shx = "sudo env HOME=($env.HOME) hx";

        nos = "nh os switch";
        nhs = "nh home switch";
        up = "sudo nix flake update --flake ${flakeDir}";

        conf = "sudo env HOME=($env.HOME) hx ${flakeDir}";
        ns = "nix-shell";

        nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        snb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
      };

  };
}
