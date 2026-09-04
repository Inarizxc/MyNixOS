{
  pkgs,
  catppuccin,
  ...
}: {
  catppuccin = {
    enable = true;
    autoEnable = true;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      session.default = "niri";
      cursor = {
        size = 20;
        theme = "catppuccin-mocha-dark-cursors";
      };
    };
  };

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-gnome];
  };
}
