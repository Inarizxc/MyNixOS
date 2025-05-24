{
  config,
  pkgs,
  catppuccin,
  ...
}: {
  imports = [
    ./modules/bundle.nix
    ./programs.nix
  ];

  home.username = "inari";
  home.homeDirectory = "/home/inari";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    NH_FLAKE = "/home/inari/NixOS";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/inari/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
