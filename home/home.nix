{ config, ... }:
{
  imports = [
    ./modules/bundle.nix
    ./programs/bundle.nix
  ];
  home =
    let
      homeDir = config.home.homeDirectory;
    in
    {
      username = "inari";
      homeDirectory = "/home/inari";

      stateVersion = "25.11";

      file = {
        ".themes/Catppuccin-Purple-Dark".source = ./.themes/Catppuccin-Purple-Dark;
      };

      sessionVariables = {
        EDITOR = "hx";
        VISUAL = "${homeDir}/.config/emacs/bin/doom emacs";
        NH_FLAKE = "${homeDir}/NixOS";
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${homeDir}/.steam/root/compatibilitytools.d";
      };

    };

  programs.home-manager.enable = true;
}
