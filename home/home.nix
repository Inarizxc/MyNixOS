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
    FLAKE = "/home/inari/NixOS";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/inari/.steam/root/compatibilitytools.d";
    SSH_ASKPASS = "";
  };

  programs.home-manager.enable = true;
}
