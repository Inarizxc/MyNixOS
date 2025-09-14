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

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   settings = {
  #     general = {
  #       gaps_out = 10;
  #       allow_tearing = true;
  #       "col.active_border" = "rgb(203,166,247)";
  #       "col.inactive_border" = "rgba(49,50,48,0.85)";
  #     };
  #     decoration = {
        
  #     };
  #   };
  # };
}
