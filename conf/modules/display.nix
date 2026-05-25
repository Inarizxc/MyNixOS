{ pkgs, catppuccin, ... }:
{
  catppuccin = {
    sddm.enable = true;
  };

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-gnome];
  };
}
