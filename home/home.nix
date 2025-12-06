{ ... }:
{
  imports = [
    ./modules/bundle.nix
    ./programs/bundle.nix
  ];

  home = {
    username = "inari";
    homeDirectory = "/home/inari";

    stateVersion = "24.05";

    file = {
      ".themes/Catppuccin-Purple-Dark".source = ./.themes/Catppuccin-Purple-Dark;
    };

    sessionVariables = {
      EDITOR = "nvim";
      NH_FLAKE = "/home/inari/NixOS";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/inari/.steam/root/compatibilitytools.d";
    };

  };

  programs.home-manager.enable = true;
}
