{pkgs, ...}: {
  catppuccin = {
    enable = true;
    autoEnable = true;
  };

  console = {
    font = "ter-v22n";
    packages = [pkgs.terminus_font];
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      session.default = "niri";
      appearance.font_family = "Maple Mono NF";
      cursor = {
        size = 20;
        theme = "catppuccin-mocha-dark-cursors";
      };
    };
  };

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-gnome];
  };
}
