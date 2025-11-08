{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
      edit_mode = "vi";
      buffer_editor = "nix";
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
        cat = "bat --paging=never";
        grep = "rg";
        find = "fd";

        shx = "sudo hx";

        nos = "nh os switch";
        nhs = "nh home switch";
        up = "sudo nix flake update --flake ${flakeDir}";

        conf = "sudo hx ${flakeDir}";
        ns = "nix-shell";

        nb = "nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
        snb = "sudo nom-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'";
      };

  };
}
