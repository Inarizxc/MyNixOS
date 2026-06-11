{
  pkgs,
  catppuccin,
  ...
}: {
  catppuccin = {
    enable = true;
    autoEnable = true;
  };

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    noctalia-greeter = {
      enable = true;
      greeter-args = "--session niri";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-gnome];
  };
}
